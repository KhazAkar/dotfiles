# Set GUI editor
export GUI_EDITOR=/usr/bin/geany

# Load bash-powerline-shell
source ~/.ps1_prompt

# Change cursor from block to IBeam
echo -e -n "\x1b[\x35 q"

# Set CLI editor
export EDITOR=/usr/bin/nano

# Aliases
alias ls='ls --color=auto'
alias kbs='tclsh /home/khazakar/bin/kbs.tcl'
alias sudo='SUDO_ASKPASS=/usr/bin/systemd-ask-password sudo -A '

# Exports
export PATH="$PATH:/opt/ActiveTcl-8.6/bin:/home/khazakar/bin/SYMICA/bin"
export PATH
