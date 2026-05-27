# ~/.zshrc

# ── oh-my-zsh ────────────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
zstyle ':omz:update' mode disabled
plugins=(git docker yarn zsh-256color kubectl laravel node wp-cli artisan)
source "$ZSH/oh-my-zsh.sh"

# ── Starship prompt ─────────────────────────────────────────────────────────
eval "$(starship init zsh)"

# ── locale & editor ──────────────────────────────────────────────────────────
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='nvim'

# ── PATH ─────────────────────────────────────────────────────────────────────
typeset -U path
for _dir in \
  "$HOME/.local/bin" \
  "$HOME/.yarn/bin" \
  "$HOME/.config/yarn/global/node_modules/.bin" \
  "$HOME/.composer/vendor/bin" \
  "$HOME/.config/phpmon/bin" \
  "$HOME/.docker/bin" \
  "$HOME/go/bin" \
  "/opt/homebrew/opt/openldap/bin"; do
  [ -d "$_dir" ] && path=("$_dir" $path)
done
unset _dir

# ── aliases ──────────────────────────────────────────────────────────────────
alias a="php artisan"
alias s="./vendor/bin/sail"
alias sc="./vendor/bin/sail composer"
alias sa="./vendor/bin/sail artisan"
alias sn="./vendor/bin/sail npm"
alias sp="./vendor/bin/sail php"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias kc='kubectl --kubeconfig <(get-kubeconfig | xxd -r -p) -n prod-hq'
alias kcp='kubectl --kubeconfig <(get-kubeconfig | xxd -r -p) -n preprod-vdc'
alias c="claude --chrome --enable-auto-mode"

get-kubeconfig() { security find-generic-password -a "$USER" -s kubeprod-config -w 2>/dev/null; }

# ── keybindings ──────────────────────────────────────────────────────────────
bindkey -r '^[[Z'
bindkey '^[[Z' undefined-key
bindkey -M menuselect '^[[Z' undefined-key

# ── misc ─────────────────────────────────────────────────────────────────────
export CLAUDE_CODE_NO_FLICKER=1
[[ "$TERM_PROGRAM" == "iTerm.app" && -e "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"

# terraform debug — uncomment when needed
# export TF_ACC=1 TF_LOG=DEBUG TF_LOG_PROVIDER=DEBUG TF_LOG_PATH=./terraform-debug.log

# ── secrets ──────────────────────────────────────────────────────────────────
[ -f "$HOME/.zsh_secrets" ] && source "$HOME/.zsh_secrets"
