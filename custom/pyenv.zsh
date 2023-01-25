export PYTHON_3_11_VERSION=3.11.1
export PYTHON_3_10_VERSION=3.10.9
export PYTHON_3_9_VERSION=3.9.16
export PYTHON_3_8_VERSION=3.8.16
export PYTHON_3_7_VERSION=3.7.16

function pyenv-create() {
  usage="USAGE
  pyenv-create <arguments>

OPTIONAL ARGUMENTS
  -v version    the python version to use, default $PYENV_DEFAULT_PYTHON
  -n name       the name of the virtual environment, default is the folder name
  -h            help about the command
"

  local python_version=$PYENV_DEFAULT_PYTHON
  local env_name

  while getopts ":v:n:h" opt; do
    case $opt in
    v) python_version="$OPTARG" ;;
    n) env_name="$OPTARG" ;;
    h) echo $usage && return 1 ;;
    esac
  done

  output=$(pyenv versions | grep -c $python_version)

  if [ "$output" == 0 ]; then
    echo "installing $python_version"
    pyenv install $python_version
  fi

  if [ ! -n "$env_name" ]; then
    echo $usage && return 1
  fi

  pyenv virtualenv $python_version $env_name
  pyenv activate $env_name
  # $(pyenv root)/versions/$env_name/bin/python -m pip install --upgrade pip
  # $(pyenv root)/versions/$env_name/bin/python -m pip install pip-tools
  pyenv local $env_name
}
