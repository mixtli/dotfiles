#!/usr/bin/env bash
curl -sL "https://raw.githubusercontent.com/Bugswriter/tuxi/main/tuxi" -o /usr/local/bin/tuxi
chmod +x /usr/local/bin/tuxi

npm install -g readability-cli

pip install neovim-remote


# install fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

