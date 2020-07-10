#!/bin/bash -x

#readonly BASE_PATH="$(dirname "$(readlink -f "$0")")"
#SCP_OPT="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -B"
SCP_OPT="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "

if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls -l --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias ll='exa -lgh'
alias la='exa -lgha'
alias l='exa -l'
alias lt='ll --tree L1'
alias ltt='ll --tree L2'
alias lttt='ll --tree L3'
alias ltttt='ll --tree L4'
alias lw='exa -lgGha'

#system
if command -v bat; then
  alias cat='bat -p'
fi
alias df='df -h'
alias showalias='cat $HOME/.bash_aliases'
alias top='htop'
alias cleanmem='sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"'
alias bigfiles="sudo du -ah / 2>/dev/null | sort -n -r | head -n 20" # TODO: Convert to function so it can receive the number as parameter.
alias permissions="sudo chown -R ${USER}:${USER} ${HOME}/klm"
alias scp="scp ${SCP_OPT} "
alias ssh="TERM=screen ssh ${SCP_OPT} "

alias vimdiff='vim -d'


ips() {
  ip -4 a | awk '/inet/ {if ($NF ~ "lo") {next}; printf("%-16s  %s\n", $NF, $2)}' | sort
}

kill-app() {
  PID=$(pgrep -f "$1")
  kill -9 "${PID}"
}


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

