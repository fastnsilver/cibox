if [ "$(docker run busybox echo 'test')" != "test" ]; then
  SUDO=sudo
  if [ "$($SUDO docker run busybox echo 'test')" != "test" ]; then
    echo "Could not run docker"
    exit 1
  fi
fi

$SUDO docker build -t fans/factory-base /opt/docker-image/base
$SUDO docker run -d --name postgres -p=5432:5432 fans/factory-base

cd "$(dirname $0)"
cat /opt/common/initialise_db.sh | $SUDO docker run --rm -i --link postgres:db fans/factory-base bash -

$SUDO docker build -t fans/stash /opt/common/containers/stash
STASH_VERSION="$($SUDO docker run --rm fans/stash sh -c 'echo $STASH_VERSION')"
$SUDO docker tag fans/stash fans/stash:$STASH_VERSION

$SUDO docker run -d --name stash --link postgres:db -p 7990:7990 -p 7999:7999 fans/stash

$SUDO docker build -t fans/jira /opt/common/containers/jira
JIRA_VERSION="$($SUDO docker run --rm fans/jira sh -c 'echo $JIRA_VERSION')"
$SUDO docker tag fans/jira fans/jira:$JIRA_VERSION

$SUDO docker run -d --name jira --link postgres:db --link stash:stash -p 8080:8080 fans/jira

echo "Containers running..."
$SUDO docker ps

echo "IP Addresses of containers:"
$SUDO docker inspect -f '{{ .Config.Hostname }} {{ .Config.Image }} {{ .NetworkSettings.IPAddress }}' postgres stash jira
