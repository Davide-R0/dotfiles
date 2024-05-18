################################################
#                                              #
#   ███████╗███████╗██╗  ██╗██████╗  ██████╗   #
#   ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝   #
#     ███╔╝ ███████╗███████║██████╔╝██║        #
#    ███╔╝  ╚════██║██╔══██║██╔══██╗██║        #
#   ███████╗███████║██║  ██║██║  ██║╚██████╗   #
#   ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   #
#                                              #
################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR='/usr/bin/nvim'

# Created by newuser for 5.9
autoload -U compinit promptinit
compinit
promptinit

setxkbmap it

zstyle ':completion::complete:*' use-cache 1

export TERMINAL='xterm'

source "/home/davide/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#alias
#colors
alias ls='ls -a --color=auto' 
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

export LESS='-R --use-color -Dd+r$Du+b$'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

#momentanei
alias BMDA='cd ~/Documents/project/BMDA/v0.1'
alias sim='cd ~/Documents/project/simulator'

#appimage
alias nvtop='/home/davide/Code/nvtop-x86_64.AppImage'

#vari
alias nv='nvim'
alias fman='compgen -c | fzf | xargs man'

#zsh configuration
source /home/davide/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#nnn file manager
export NNN_OPTS="e" # H: see hide files
NNN_PLUG_GENERAL='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'
NNN_PLUG_COMMAND='x:!chmod +x "$nnn";g:!git log' #;r:!rm -r "$nnn"'    #x: executable, g: git log view
#export NNN_ARCHIVE='fuse-archive'
export NNN_PLUG="$NNN_PLUG_GENERAL;$NNN_PLUG_COMMAND"
#Bookmarks
export NNN_BMS="s:$HOME/Desktop/;d:$HOME/Documents/;D:$HOME/Downloads/;m:/run/media/davide/" #press b to list bookmarsk and - to go back


#Latex lsp
export PATH="$PATH:/home/davide/.local/share/nvim/ext-plugged/ltex-ls-16.0.0/bin"

#Local bin 
export PATH="/home/davide/.local/bin:$PATH"

#Cargo 
export PATH="$PATH:/home/davide/.cargo/bin"
