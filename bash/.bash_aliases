#!/bin/bash -x

#readonly BASE_PATH="$(dirname "$(readlink -f "$0")")"
SCP_OPT="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -B"

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
  ip -4 a | awk '/inet/ {if($NF ~ "lo") {next}; printf("%-16s  %s\n", $NF, $2)}' | sort
}

kill-app() {
  PID=$(pgrep -f "$1")
  kill -9 "${PID}"
}

alias vm="ssh centos@192.168.200.71"
alias permission="sudo chown -R ${USER}:${USER} ${HOME}/klm"

box_bin="${HOME}/klm/src/others/box/box.sh"
clean-boxes() {
  sudo "${box_bin}" clean
}

list-boxes() {
  sudo "${box_bin}" list
}

docker-clean() {
  # shellcheck disable=SC2086
  docker rmi -f $(docker images -q)
}

docker-ip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

docker-pid() {
  docker inspect --format '{{ .State.Pid }}' "$@"
}

docker-prune() {
  yes | docker system prune
}

cp-tts() {
  local file dest user
  file=$1
  dest=${2:-controller-0}
  user=${3:-vagrant}
  scp ${SCP_OPT} "${file}" "${user}@${dest}:/home/${user}"
}

