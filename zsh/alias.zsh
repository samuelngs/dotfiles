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
alias rescan='sudo iwlist wlp2s0 scan > /dev/null && nmcli -p dev wifi list | sort -u -k1,1 | grep -Ev "\---|\===|Wi-Fi scan" | sed "/^$/d"'
alias rs='sudo iwlist wlp2s0 scan > /dev/null && nmcli -p dev wifi list | sort -u -k1,1 | grep -Ev "\---|\===|Wi-Fi scan" | sed "/^$/d"'
alias rs='nmcli d wifi rescan wlp2s0 && nmcli d wifi list ifname wlp2s0'
alias rc='nmcli n off && nmcli n on'
# Clear history
alias hc='echo "" > ~/.zsh_history & exec $SHELL -l'
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
# Network Scan
alias scan='sudo nmap -v -O --osscan-guess'
alias p8='ping 8.8.8.8'
# Image Viewer
alias img='feh'
alias image='feh'
# Password gen
# alias pg='python -c "import base64, os; print base64.b32encode(os.urandom(40))"'
alias pg='xxd -u -p -c32 /dev/urandom | head -n1'
alias ts='ab -k -n 200000 -c 5000'
# git on/off
alias gitn='git config --add oh-my-zsh.hide-status 0'
alias gitf='git config --add oh-my-zsh.hide-status 1'
