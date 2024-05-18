# /etc/skel/.bashrc

#########################################################
#                                                       #
#   ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗    #
#   ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝    #
#   ██████╔╝███████║███████╗███████║██████╔╝██║         #
#   ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║         #
#   ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗    #
#   ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    #
#                                                       #    
#########################################################

# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Add the following line at the beginning of bashrc
[[ $- == *i* ]] &&
  source "$HOME/.local/share/blesh/ble.sh" --attach=none

#ble.sh colors personalization:
source "$HOME/.config/ble/color_ble.sh"

#autodetect usb
devmon 2>&1 > /dev/null &

#keyboard setup
setxkbmap it

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

########## Put your fun stuff here #########

############## SYSTEM VARIABLE #############
export TERM=xterm-256color
export SHELL=bash
export CLICOLOR=TRUE
export EDITOR='/usr/bin/nvim'
export TERMINAL=xterm
#export DISPLAY='localhost:10.0'

######## CUSTOM PROMPT COMMAND LINE #########

# https://bash-prompt-generator.org/
#PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;88;1m\][\[\e[0;38;5;28m\]\H\[\e[38;5;88m\]]\[\e[0m\] \[\e[38;5;26m\]\w\[\e[38;5;214m\]${PS1_CMD1}\n\[\e[0m\] \[\e[2m\]>\[\e[0m\] '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[1m\][\[\e[0;38;5;28m\]\H\[\e[0m\]] \[\e[38;5;88m\]\w\[\e[38;5;214m\]${PS1_CMD1}\n\[\e[0m\] ❯ '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[1m\][\[\e[0;38;5;28m\]\H\[\e[0m\]] \[\e[38;5;88m\]\w\[\e[38;5;214m\]${PS1_CMD1}\n\[\e[0m\] \[\e[38;5;76m\]❯\[\e[0m\] '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[1m\][\[\e[0;38;5;167m\]\s\[\e[0m\]-\[\e[38;5;109m\]\u\[\e[0m\]-\[\e[38;5;77m\]\H\[\e[0m\]-\[\e[38;5;185m\]\l\a\[\e[0m\]] \[\e[97;48;5;87m\]\w\[\e[0;38;5;214m\]${PS1_CMD1}\n\[\e[0m\] \$ '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;61m\][\[\e[38;5;167m\]\s\[\e[0m\]-\[\e[38;5;109m\]\u\[\e[0m\]-\[\e[38;5;77m\]\h\[\e[0m\]-\[\e[38;5;185m\]\l\a\[\e[38;5;96m\]]\[\e[0m\] \[\e[38;5;105m\]\w\[\e[38;5;214m\]${PS1_CMD1}\n\[\e[0m\] \[\e[38;5;71m\]\$\[\e[0m\] '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;61m\][\[\e[38;5;167m\]\s\[\e[38;5;105m\]_\[\e[38;5;77m\]\H\[\e[38;5;141m\]_\[\e[38;5;109m\]\u\[\e[38;5;141m\]_\[\e[38;5;185m\]\l\a\[\e[38;5;96m\]]\[\e[0m\] \[\e[38;5;105m\]\w\[\e[38;5;214m\]${PS1_CMD1}\n\[\e[0m\] \[\e[38;5;71m\]\$\[\e[0m\] '
#PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;61m\][\[\e[38;5;167m\]\s\[\e[0;2m\]_\[\e[0;38;5;77m\]\H\[\e[0;2m\]_\[\e[0;38;5;109m\]\u\[\e[0;2m\]_\[\e[0;38;5;185m\]\l\[\e[38;5;96m\]]\[\e[0m\] \[\e[38;5;105m\]\w\[\e[38;5;214m\]${PS1_CMD1}\n\[\e[0m\] \[\e[38;5;71m\]\$\[\e[0m\] '
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; 
PS1='\[\e[38;5;61m\][\[\e[38;5;167m\]\s\[\e[0;2m\]_\[\e[0;38;5;77m\]\H\[\e[0;2m\]_\[\e[0;38;5;109;1m\]\u\[\e[0;2m\]_\[\e[0;38;5;193m\]${TERMINAL}\[\e[0;2m\]_\[\e[0;38;5;185m\]\l\[\e[38;5;96m\]]\[\e[0m\] \[\e[2m\]\#\[\e[0m\] \[\e[2m\]$?\[\e[0m\] \[\e[38;5;105m\]\w\[\e[38;5;214m\]${PS1_CMD1}\n\[\e[0m\] \[\e[38;5;71m\]\$\[\e[0m\] '
source ~/.config/bash/.git-completion.bash
source ~/.config/bash/.git-prompt.sh 
export GIT_PS1_SHOWDIRTYSTATE=1

# VIM MODE
#if [[ $- == *i* ]]; then # in interactive session
#  set -o vi
#fi

################## ALIAS ##################
# Kitty
#alias kdiff='kitten diff'
#alias kcat='kitten icat'

#colors
alias ls='ls -a --color=auto' 
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

#export LESS='-R --use-color -Dd+r$Du+b$'
#export MANPAGER="less -R --use-color -Dd+r -Du+b"
#export MANROFFOPT="-P -c"

#momentanei
alias SDL='cd ~/Documents/programming/SDL-Tutorial'
alias CUDA='cd ~/Documents/programming/CUDA-Tutorial'
alias HIP='cd ~/Documents/programming/HIP'

alias BMDA='cd ~/Documents/project/BMDA/v0.1'

alias sim='cd ~/Documents/project/simulator'

alias TCF='cd ~/Desktop/uni/TCF'

#appimage
alias nvtop='/home/davide/Code/nvtop-x86_64.AppImage'

#vari
alias nv='nvim'
#alias fman='compgen -c | fzf | xargs man'

################### NNN ##################
#export NNN_OPTS="e" # H: see hide files
NNN_PLUG_GENERAL='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'
NNN_PLUG_COMMAND='x:!chmod +x "$nnn";g:!git log' #;r:!rm -r "$nnn"'    #x: executable, g: git log view
#export NNN_ARCHIVE='fuse-archive'
export NNN_PLUG="$NNN_PLUG_GENERAL;$NNN_PLUG_COMMAND"
#Bookmarks
export NNN_BMS="s:$HOME/Desktop/;d:$HOME/Documents/;D:$HOME/Downloads/;m:/run/media/davide/" #press b to list bookmarsk and - to go back


################## PATH ##################
#Latex lsp
export PATH="$PATH:/home/davide/.local/share/nvim/ext-plugged/ltex-ls-16.0.0/bin"
#Local bin 
export PATH="/home/davide/.local/bin:$PATH"
#Cargo 
export PATH="$PATH:/home/davide/.cargo/bin"


# Add the following line at the end of bashrc
[[ ${BLE_VERSION-} ]] && ble-attach
