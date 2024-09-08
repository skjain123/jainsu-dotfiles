# Setup fzf
# ---------
if [[ ! "$PATH" == */home/sunil/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/sunil/.fzf/bin"
fi

source <(fzf --zsh)
