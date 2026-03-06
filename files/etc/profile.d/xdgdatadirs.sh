XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
LOCAL_SHARE=/usr/local/share

result=""

_add_if_missing() {
  [ -z "$1" ] && return
  case ":$result:" in
    *":$1:"*) return ;;
  esac
  if [ -z "$result" ]; then
    result="$1"
  else
    result="$result:$1"
  fi
}

_add_if_missing "$XDG_DATA_HOME"
_add_if_missing "$LOCAL_SHARE"

rest=${XDG_DATA_DIRS:-}
while [ -n "$rest" ]; do
  entry=${rest%%:*}
  _add_if_missing "$entry"
  case "$rest" in
    *:*) rest=${rest#*:} ;;
    *) rest= ;;
  esac
done

export XDG_DATA_DIRS="$result"
