function cdw() { cd ~/workspace/$1; }
function wcode() {
  _pwd=$(pwd)
  cd ~/workspace/$1
  pyenv activate
  code .
  pyenv deactivate
  cd $_pwd
}

function update-workspace() {
  for f in ~/workspace/*; do
    if [ -d "$f" ]; then
      echo "Updating $f..."
      echo
      cd $f
      git checkout $(git_main_branch)
      git pull --rebase --prune
      git fetch -t
      git stash clear
      echo
    fi
  done
  cd ~/workspace
}


function dockerm() {
  eval $(minikube docker-env)
  docker $@
}
