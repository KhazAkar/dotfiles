# Load git-prompt support
source ~/.config/bash_git

# Load bash-powerline-shell
source ~/.config/ps1_prompt

# Fortune
if [ -x /usr/bin/fortune ] ; then
    echo
    /usr/bin/fortune
    echo
fi

# Change cursor from block to IBeam
echo -e -n "\x1b[\x35 q"

# Aliases
alias ls='ls --color=auto'
alias sudo='SUDO_ASKPASS=/usr/bin/systemd-ask-password sudo -A'
