. $HOME/.config/shell-agnostic/aliases.sh
. $ZDOTDIR/prompt.sh
. $HOME/.config/shell-agnostic/common-vars.sh

autoload -U compinit; compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
_comp_options+=(globdots)
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' menu select

bindkey -v
bindkey '^R' history-incremental-search-backward
