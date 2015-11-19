# Tmux exit cmd override
# alias exit="if [ ${TMUX} ]; then tmux detach; else exit; fi"
# Copy and paste
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'
# Network manager
alias network='nmtui'
alias nn='nmtui'
alias rescan='sudo iwlist wlp2s0 scan'
alias rs='sudo iwlist wlp2s0 scan'
# List files
alias ls='ls --color=auto'
alias sl='du -ksh * | sort -hr'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# Screen background light
alias bi='xbacklight -inc 20'
alias bd='xbacklight -dec 20'
# Mount/Unmount secure disk
alias dev='. /usr/local/bin/mount-dev'
alias undev='. /usr/local/bin/umount-dev'
# NeoVim
alias vim='nvim'
# Docker Compose
alias compose='/usr/local/bin/docker-compose'
