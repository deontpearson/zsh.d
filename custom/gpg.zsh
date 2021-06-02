function gpge() {
  usage="USAGE
  gpge <arguments>

REQUIRED ARGUMENTS
  -r name.surname       the recipient email to send the file to
  -f /path/to.file       the path to the file to encrypt

OPTIONAL ARGUMENTS
  -h                    help about the command
"
  [ $# -lt 1 ] && {
    echo "$usage"
    return 1
  }

  while getopts ":r:f:h" opt; do
    case $opt in
    r) recipient="$OPTARG" ;;
    f) file="$OPTARG" ;;
    h)
      echo $usage
      return 1
      ;;
    esac
  done
  gpg --recipient $recipient --encrypt --armor $file
}

function gpgd() {
  usage="USAGE
  gpgd <arguments>

REQUIRED ARGUMENTS
    -f /path/to/file      the path to the file to encrypt

OPTIONAL ARGUMENTS
  -h                      help about the command
"
  [ $# -lt 1 ] && {
    echo "$usage"
    return 1
  }

  while getopts ":f:h" opt; do
    case $opt in
    f) file="$OPTARG" ;;
    h)
      echo $usage
      return 1
      ;;
    esac
  done
  gpg --decrypt $file
}
