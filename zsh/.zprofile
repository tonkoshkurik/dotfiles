eval "$(/opt/homebrew/bin/brew shellenv)"

# Python is provided by brew (python3) + uv (`uv python install`). pyenv removed.

# Added by Toolbox App
export PATH="$PATH:/usr/local/bin"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
