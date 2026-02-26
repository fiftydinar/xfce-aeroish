if [ ! -e "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-4.0/gtk.css" ]; then
  ln -s /usr/share/themes/ReVista/gtk-4.0/gtk.css "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-4.0/gtk.css"
fi
if [ ! -e "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-4.0/assets" ]; then
  ln -s /usr/share/themes/ReVista/gtk-4.0/assets "${XDG_CONFIG_HOME:-$HOME/.config}/.config/gtk-4.0/assets"
fi
