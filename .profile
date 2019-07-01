# Test
test -z "$PROFILEREAD" && . /etc/profile || true
# Fortune
if [ -x /usr/bin/fortune ] ; then
    echo
    /usr/bin/fortune
    echo
fi
# Exports
export XDG_CONFIG_HOME=/home/khazakar/.config
export LIBVA_DRIVER_NAME=i965
