# dotfiles

macOS (Apple Silicon) config for zsh + Neovim.

## Layout

```
zsh/
  .zshrc                 oh-my-zsh + Starship
  .zprofile              brew shellenv, OrbStack
  .zsh_secrets.example   template for ~/.zsh_secrets
nvim/                    kickstart.nvim-based Lua config
Brewfile                 Homebrew packages
install.sh               symlinks everything into place
```

## New machine

```bash
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/tonkoshkurik/dotfiles.git ~/.dotfiles
brew bundle --file ~/.dotfiles/Brewfile

# oh-my-zsh + the zsh-256color plugin used by .zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/chrissicool/zsh-256color ~/.oh-my-zsh/custom/plugins/zsh-256color

~/.dotfiles/install.sh
$EDITOR ~/.zsh_secrets    # fill in real tokens
nvim                      # installs plugins from lazy-lock.json
```

`uv` and `claude` aren't on Homebrew — install via their own scripts.

## Notes

- Commit `nvim/lazy-lock.json` after `:Lazy update`.
- Secrets live in `~/.zsh_secrets`; mirror new vars into `.zsh_secrets.example`.
