if [ "$(docker run busybox echo 'test')" != "test" ]; then
  SUDO=sudo
  if [ "$($SUDO docker run busybox echo 'test')" != "test" ]; then
    echo "Could not run docker"
    exit 1
  fi
fi

$SUDO docker build -t fns/factory-base containers/base
$SUDO docker run -d --name postgres -p=5432:5432 fns/factory-base

cd "$(dirname $0)"
cat initialise_db.sh | $SUDO docker run --rm -i --link postgres:db fns/factory-base bash -

$SUDO docker build -t fns/stash ../common/containers/stash
STASH_VERSION="$($SUDO docker run --rm fns/stash sh -c 'echo $STASH_VERSION')"
$SUDO docker tag fns/stash fns/stash:$STASH_VERSION

$SUDO docker run -d --name stash --link postgres:db -p 7990:7990 -p 7999:7999 fns/stash

$SUDO docker build -t fns/jira ../common/containers/jira
JIRA_VERSION="$($SUDO docker run --rm fns/jira sh -c 'echo $JIRA_VERSION')"
$SUDO docker tag fns/jira fns/jira:$JIRA_VERSION

$SUDO docker run -d --name jira --link postgres:db --link stash:stash -p 8080:8080 fns/jira

echo "Containers running..."
$SUDO docker ps

echo "IP Addresses of containers:"
$SUDO docker inspect -f '{{ .Config.Hostname }} {{ .Config.Image }} {{ .NetworkSettings.IPAddress }}' postgres stash jira
