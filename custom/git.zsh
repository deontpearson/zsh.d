function git-branches() {
  usage="USAGE
  git-branches <command> <argument>

CORE COMMANDS
  clean       clean all git branches in repo
  list        list all git branches in repo

OPTIONAL ARGUMENTS
  -h          help about the command
"
  case $1 in
  'clean')
    echo 'Cleaning branches'
    read -s -k '?Press any key to continue....'
    echo
    git branch | grep -v $(git_man_branch) | xargs git branch -D
    ;;
  'list') git branch --sort=-committerdate | head ;;
  *) echo $usage ;;
  esac
}

function git-tags() {
  usage="USAGE
  git-tags

CORE COMMANDS
  clean       cleans all git tags from repo

OPTIONAL COMMANDS
  -h          help about the command
"
  case $1 in
  'clean')
    echo 'Cleaning tags'
    read -s -k '?Press any key to continue....'
    echo
    git tag -l | xargs git tag -d
    git fetch -t
    ;;
  *) echo $usage ;;
  esac
}

function gcbm() {
  git checkout -b $@ origin/$(git_main_branch)
}
