function cdw() { cd ~/workspace/$1; }
function wcode() {
  _pwd=$(pwd)
  cd ~/workspace/$1
  pyenv activate
  code .
  pyenv deactivate
  cd $_pwd
}

function cdl() {
  cd $1
  la
}

function bsp() {
  usage="USAGE
  bsp <command> <argument>

CORE COMMANDS
  on        set the system proxy to 127.0.0.1:8080 for burpsuite
  off        turn off the system proxy

OPTIONAL ARGUMENTS
  -h        help about the command
"

  [ $# -eq 0 ] && {
    echo $usage
    return 1
  }

  case $1 in
  'on')
    networksetup -setwebproxy Wi-Fi 127.0.0.1 8080
    networksetup -setwebproxystate Wi-Fi on
    networksetup -setsecurewebproxy Wi-Fi 127.0.0.1 8080
    networksetup -setsecurewebproxystate Wi-Fi on
    ;;
  'off')
    networksetup -setwebproxy Wi-Fi Empty Empty
    networksetup -setwebproxystate Wi-Fi off
    networksetup -setsecurewebproxy Wi-Fi Empty Empty
    networksetup -setsecurewebproxystate Wi-Fi off
    ;;
  *) echo $usage ;;
  esac
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
