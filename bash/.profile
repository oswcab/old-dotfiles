# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

export GOROOT=/usr/local/go
export GOPATH=$HOME/klm
export GOBIN=$GOPATH/bin
export WORKSPACE=$HOME/klm/src/
export GITLAB_PRIVATE_TOKEN=ZEaEw4R8GQ7pLYLTBHJA
export VAGRANT_HOME=$HOME/.vagrant.d
export KUBECONFIG=$HOME/klm/src/ocp-playground/ignition/auth/kubeconfig

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$GOROOT/bin:$GOBIN:/usr/local/git/bin:$HOME/klm/src/ocp-playground/bin

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$HOME/bin/scripts:$PATH"
fi

export PATH

export VSSH_USERNAME=hoc
