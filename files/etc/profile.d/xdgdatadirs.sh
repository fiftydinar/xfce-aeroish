XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
LOCAL_SHARE=/usr/local/share

# /usr/local/share
case ":${XDG_DATA_DIRS:-}:" in
  *":${LOCAL_SHARE}:"*)
    ;;
  *)
    export XDG_DATA_DIRS="${XDG_DATA_DIRS:+${XDG_DATA_DIRS}:}${LOCAL_SHARE}"
    ;;
esac

# XDG_DATA_HOME
case ":${XDG_DATA_DIRS:-}:" in
  *":${XDG_DATA_HOME}:"*)
    ;;
  *)
    export XDG_DATA_DIRS="${XDG_DATA_HOME}${XDG_DATA_DIRS:+:}${XDG_DATA_DIRS}"
    ;;
esac
