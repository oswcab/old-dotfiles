#!/bin/bash -x

#readonly BASE_PATH="$(dirname "$(readlink -f "$0")")"

if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls -l --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ltr='ls -ltr'
alias ll='ls -AlhHF'
alias la='ls -A'
alias l='ls -CF'

#system
alias df='df -h'
alias showalias='cat $HOME/.bash_aliases'
alias top='htop'
alias cleanmem='sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"'
alias bigfiles="sudo du -ah / 2>/dev/null | sort -n -r | head -n 20" # TODO: Convert to function so it can receive the number as parameter.

if command -v bat; then
  alias cat='bat -p'
fi

ips() {
  ip a | awk '/inet / {printf(\"%-16s  %s \n\", \$NF, \$2)}'
}

kill-app() {
  PID=$(pgrep -f "$1")
  kill -9 "${PID}"
}

#set -x
#if grep -q fedora /etc/os-release; then
#  if [[ -f "${BASE_PATH}/.fedora_aliases" ]]; then
#    source "${BASE_PATH}/.fedora_aliases"
#  fi
#fi

alias vm="ssh centos@192.168.200.71"

clean-boxes() {
  sudo "${HOME}/klm/src/box/box.sh" clean
}

list-boxes() {
  sudo "${HOME}/klm/src/box/box.sh" list
}

docker-clean() {
  exec docker rmi -f $(docker images -q)
}

docker-ip() {
  exec docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

docker-pid() {
  exec docker inspect --format '{{ .State.Pid }}' "$@"
}

docker-prune() {
  exec yes | docker system prune
}

#if grep -q mint /etc/os-release && [[ -f "{BASE_PATH}/.mint_aliases" ]]; then
#  source "${BASE_PATH}/.mint_aliases"
#fi

