if [ "$(docker run busybox echo 'test')" != "test" ]; then
  SUDO=sudo
  if [ "$($SUDO docker run busybox echo 'test')" != "test" ]; then
    echo "Could not run docker"
    exit 1
  fi
fi

$SUDO docker build -t alstom/factory-base containers/base
$SUDO docker run -d --name postgres -p=5432:5432 alstom/factory-base

cd "$(dirname $0)"
cat initialise_db.sh | $SUDO docker run --rm -i --link postgres:db alstom/factory-base bash -

$SUDO docker build -t alstom/stash containers/stash
STASH_VERSION="$($SUDO docker run --rm alstom/stash sh -c 'echo $STASH_VERSION')"
$SUDO docker tag alstom/stash alstom/stash:$STASH_VERSION

$SUDO docker run -d --name stash --link postgres:db -p 7990:7990 -p 7999:7999 alstom/stash

$SUDO docker build -t alstom/jira containers/jira
JIRA_VERSION="$($SUDO docker run --rm alstom/jira sh -c 'echo $JIRA_VERSION')"
$SUDO docker tag alstom/jira alstom/jira:$JIRA_VERSION

$SUDO docker run -d --name jira --link postgres:db --link stash:stash -p 8080:8080 alstom/jira

echo "Containers running..."
$SUDO docker ps

echo "IP Addresses of containers:"
$SUDO docker inspect -f '{{ .Config.Hostname }} {{ .Config.Image }} {{ .NetworkSettings.IPAddress }}' postgres stash jira
