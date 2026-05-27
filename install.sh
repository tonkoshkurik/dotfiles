#!/usr/bin/env bash
# Symlink the dotfiles into place. Safe to re-run — anything replaced is backed up.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

link() {
  local src="$1" dest="$2"
  if [ -L "$dest" ]; then
    ln -sfn "$src" "$dest"
  elif [ -e "$dest" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
    echo "  backed up $dest -> $BACKUP_DIR/"
    ln -sfn "$src" "$dest"
  else
    mkdir -p "$(dirname "$dest")"
    ln -sfn "$src" "$dest"
  fi
  echo "  linked $dest -> $src"
}

echo "Linking dotfiles from $DOTFILES ..."
link "$DOTFILES/zsh/.zshrc"    "$HOME/.zshrc"
link "$DOTFILES/zsh/.zprofile" "$HOME/.zprofile"
link "$DOTFILES/nvim"          "$HOME/.config/nvim"

# seed ~/.zsh_secrets from the template on first run
if [ ! -f "$HOME/.zsh_secrets" ]; then
  cp "$DOTFILES/zsh/.zsh_secrets.example" "$HOME/.zsh_secrets"
  chmod 600 "$HOME/.zsh_secrets"
  echo "  created ~/.zsh_secrets from template — fill in real tokens"
fi

echo "Done. Open a new terminal, or run: source ~/.zshrc"
