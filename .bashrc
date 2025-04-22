# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\]]\!: '
    PS1='[\[\033[01;34m\]\w\[\033[00m\]]\!: '
else
    PS1='\w: '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\W\a\]$PS1"
    ;;
*)
    ;;
esac


# enable vi command line editing mode
#set -o vi

export PATH=$PATH:/work1/sleduc/kalrayEnv

export PYTHONUSERBASE=/work1/sleduc/.python
export PATH=$PYTHONUSERBASE/bin:$PATH
export HF_HOME=/work1/sleduc/.huggingface_cache

export GIT_EDITOR=vim
export EDITOR=vim

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


if [ -f /work1/sleduc/kalrayEnv/kalrayrc-completion.sh ]; then
    . /work1/sleduc/kalrayEnv/kalrayrc-completion.sh
fi

[ -d /nfs/tools/software/kerrit/ ] && export PATH=$PATH:/nfs/tools/software/kerrit/

#cd /work1/sleduc

# fix vim cursor shape
echo -ne "\e[2 q"

#if [ -z "$TMUX" ]; then
    #tmux attach -t base || tmux new -s base
#fi
