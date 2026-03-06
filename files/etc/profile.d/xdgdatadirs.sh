XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

case ":${XDG_DATA_DIRS:-}:" in
  *":${XDG_DATA_HOME}:"*) 
    ;;
  *)
    export XDG_DATA_DIRS="${XDG_DATA_HOME}${XDG_DATA_DIRS:+:}${XDG_DATA_DIRS}"
    ;;
esac
