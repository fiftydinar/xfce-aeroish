mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0"
if [ ! -e "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/gtk.css" ]; then
  ln -s /etc/gtk-3.0/gtk.css "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/gtk.css"
fi
if [ ! -e "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/orb.png" ]; then
  ln -s /etc/gtk-3.0/orb.png "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/orb.png"
fi
if [ ! -e "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/orb-checked.png" ]; then
  ln -s /etc/gtk-3.0/orb-checked.png "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/orb-checked.png"
fi
if [ ! -e "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/orb-hover.png" ]; then
  ln -s /etc/gtk-3.0/orb-hover.png "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/orb-hover.png"
fi
if [ ! -e "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/panelbg.xcf" ]; then
  ln -s /etc/gtk-3.0/panelbg.xcf "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/panelbg.xcf"
fi
