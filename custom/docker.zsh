function docker-clean() {
  echo 'WARNING!\tRemoving unused images (docker images prune)'
  docker image prune -a
  echo 'WARNING!\tRemoving containers (docker rm)'
  docker rm $(docker ps --all -q -f status=exited)
  echo 'WARNING!\tRemoving images (docker rmi)'
  docker rmi $(docker images | grep none | awk '{print $3}') -f
}
