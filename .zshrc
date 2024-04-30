if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# History buffer
HISTSIZE=500
SAVEHIST=500
HISTFILE=~/.zsh_history

# Theme
zinit ice depth=1; zinit light romkatv/powerlevel10k
source ~/.zsh/colored-commands.zsh
zinit snippet OMZP::colored-man-pages

# Movement
# zinit light IngoMeyer441/zsh-easy-motion
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# Syntax
zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

autoload compinit
compinit

zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
zinit light hlissner/zsh-autopair 

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust


source /home/greatgatsby/.local/share/lscolors.sh
### End of Zinit's installer chunk

#Remove superfluous blanks from each command line being added to the history list
setopt histreduceblanks
#Do not enter command lines into the history list if they are duplicates of the previous event.
setopt histignorealldups
# Try to correct the spelling of commands
setopt correct
#NOCLOBBER prevents you from accidentally overwriting an existing file.
setopt noclobber

# Aliases
alias nv="neovim"
alias c="clear"
alias update="sudo apt update && sudo apt upgrade -y"
alias distro="cat /etc/*-release"
alias ec='${EDITOR:-vim} ${ZDOTDIR:-$HOME}/.zshrc'
alias sc="source $HOME/.zshrc"
alias python="/usr/bin/python3.11"


# General Settings
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export KEYTIMEOUT=20
export PATH=”$PATH:/home/greatgatsby/.local/bin”
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

#Keybind
bindkey '^Y' autosuggest-accept
ZVM_VI_ESCAPE_BINDKEY='jj'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
