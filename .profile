# Test
test -z "$PROFILEREAD" && . /etc/profile || true
# Exports
# Default config dir
export XDG_CONFIG_HOME=/home/khazakar/.config
# Default video playback hw accel driver 
export LIBVA_DRIVER_NAME=i965
# export PATH
export PATH="$PATH:/opt/ActiveTcl-8.6/bin:/home/khazakar/bin/SYMICA/bin"
export PATH
# Set GUI editor
export GUI_EDITOR=/usr/bin/geany
# Set CLI editor
export EDITOR=/usr/bin/nano
