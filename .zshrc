# Historial
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# Colores en ls, cat, git
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first'
alias cat='bat --paging=never'
alias grep='rg'

# Prompt bonito (starship)
eval "$(starship init zsh)"

# Autosugerencias (texto gris tipo Copilot)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Resaltado de sintaxis mientras escribes (SIEMPRE AL FINAL del archivo)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf (busqueda difusa en historial con Ctrl+R)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# git-delta para diffs bonitos
export GIT_PAGER="delta"
