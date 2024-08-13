function cdw() { cd ~/workspace/$1; }
function wcode() {
  _pwd=$(pwd)
  cd ~/workspace/$1
  pyenv activate
  code .
  pyenv deactivate
  cd $_pwd
}
function wzed() {
  _pwd=$(pwd)
  cd ~/workspace/$1
  pyenv activate
  zed .
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


function deep-clean() {
    rm -rf build dist wheels *.egg-info
	rm -rf */build */dist
	find . -path '*/__pycache__/*' -delete
	find . -type d -name '__pycache__' -empty -delete
	rm -rf '.mypy_cache'
	rm -rf '.pytest_cache'
	rm -rf '.coverage'
	rm -f '.coverage.*'
	rm -rf '.import_linter_cache'
	rm -rf '.ipynb_checkpoints'
}
