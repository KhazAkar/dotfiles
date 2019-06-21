test -z "$PROFILEREAD" && . /etc/profile || true

if [ -x /usr/bin/fortune ] ; then
    echo
    /usr/bin/fortune
    echo
fi
export XDG_CONFIG_HOME=/home/khazakar/.config

