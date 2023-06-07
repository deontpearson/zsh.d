function pyenv-create() {
  usage="USAGE
  pyenv-create <arguments>

OPTIONAL ARGUMENTS
  -v version    the python version to use, default $PYENV_DEFAULT_PYTHON
  -n name       the name of the virtual environment, default is the folder name
  -h            help about the command
"
  local python_version
  local env_name

  while getopts ":v:n:h" opt; do
    case $opt in
    v) python_version="$OPTARG" ;;
    n) env_name="$OPTARG" ;;
    h) echo $usage && return 1 ;;
    esac
  done

  python_latest=$(pyenv install --list | awk '{ print $1 }' | grep ^$PYTHON_VERSION | sort -V | tail -n 1)
  echo "installing $python_latest"
  pyenv install $python_latest --skip-existing

  if [ ! -n "$env_name" ]; then
    echo $usage && return 1
  fi

  pyenv virtualenv $python_version $env_name
  pyenv activate $env_name
  pyenv local $env_name
}
