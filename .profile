# Test
test -z "$PROFILEREAD" && . /etc/profile || true
# Exports
# Default config dir
export XDG_CONFIG_HOME=$HOME/.config
# Default video playback hw accel driver 
export LIBVA_DRIVER_NAME=i965
# export IRIS driver for intel iGPUs
export MESA_LOADER_DRIVER_OVERRIDE=iris
# export CFLAGS for blender to use GCC 8
export CYCLES_CUDA_EXTRA_CFLAGS="-ccbin g++-8"
# export PATH
export PATH="$PATH:/opt/ActiveTcl-8.6/bin:$HOME/bin/apps/kitty/bin:$HOME/bin/scripts/apps/:$HOME/bin/games/"
export PATH
# Set GUI editor
export GUI_EDITOR=/usr/bin/geany
# Set CLI editor
export EDITOR=/usr/bin/emacs
