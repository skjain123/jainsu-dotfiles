ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then 
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

eval "$(starship init zsh)"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bold,underline"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"





# ALIASES

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
else 
    mkdir ~/.zsh_aliases
fi

aliasp() {
    if [ "$#" -ne 2 ]; then
        echo "Error: Usage is aliasp <alias_name> <command>"
        return 1
    fi

    echo "alias $1='$2'" >> ~/.zsh_aliases
    alias $1=$2
    # source ~/.zsh_aliases
}
export aliasp

alias_rem() {
    if [ "$#" -ne 1 ]; then
        echo "Error: Usage is aliasp <alias_name>"
        return 1
    fi
    if grep -q "alias $1=" ~/.zsh_aliases; then
        #remove alias
        sed -i "/alias $1=/d" ~/.zsh_aliases
        unalias $1

        echo "Alias $1 removed"
    else
        echo "Error: Alias '$1' not found in .zsh_aliases"
        return 1
    fi 
}
export alias_rem


# PRINT TODO LIST
if [ -f ~/TODO.txt ]; then
    cat ~/TODO.txt
else 
    touch ~/TODO.txt
fi


# -------------------------------------------------------------------


# # Set up the prompt
#
# autoload -Uz promptinit
# promptinit
# prompt adam1
#
# setopt histignorealldups sharehistory
#
# # Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e
#
# # Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
# HISTSIZE=1000
# SAVEHIST=1000
# HISTFILE=~/.zsh_history
#
# # Use modern completion system
# autoload -Uz compinit
# compinit
#
# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true
#
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

