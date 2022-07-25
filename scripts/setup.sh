#!/bin/bash

#                         ____   _____    _____      _
#                        / __ \ / ____|  / ____|    | |
#   _ __ ___   __ _  ___| |  | | (___   | (___   ___| |_ _   _ _ __
#  | '_ ` _ \ / _` |/ __| |  | |\___ \   \___ \ / _ \ __| | | | '_ \
#  | | | | | | (_| | (__| |__| |____) |  ____) |  __/ |_| |_| | |_) |
#  |_| |_| |_|\__,_|\___|\____/|_____/  |_____/ \___|\__|\__,_| .__/
#                                                             | |
#                                                             |_|

#--- Homebrew ---#

echo 'Are the Xcode command line tools installed?'
echo 'If not exit with ⌃C, and install Xcode along with other MAS apps or use:'
echo 'xcode-select -install'
echo ' '
echo 'MAS apps to install:'
echo 'Xcode, Logitech Options, 1Blocker, Dropover, Affinity, Elmedia Player, Cloudmounter,
FastDMNG, CleanShot'

read response

sudo -v
cd ~

#--- Check if Homebrew is installed and install if not ---#
if test ! $(which brew); then
  echo "Installing Homebrew... "
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed"
  exit 1
fi

#--- Install / Update Apps via Homebrew ---#

brew=(
  git
  bat
  ccls
  cmake
  curl
  fd
  fortune
  fzf
  gcc
  gh
  gotop
  gradle
  htop
  jq
  lazygit
  llvm
  lua
  luarocks
  neofetch
  neovim
  node
  openjdk
  ranger
  ripgrep
  starship
  tmux
  the_silver_searcher
  umlet
  wget
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

cask=(
  1password
  alfred
  alt-tab
  bartender
  cleanshot
  cloudmounter
  coteeditor
  daisydisk
  dbngin
  discord
  elmedia-player
  espanso
  fig
  figma
  filebot
  filebot
  font-fira-code
  font-fira-code-nerd-font
  font-hack-nerd-font
  font-jetbrains-mono-nerd-font
  google-chrome
  iterm2
  itsycal
  jettison
  keepingyouawake
  keka
  mos
  openinterminal
  pika
  private-internet-access
  raspberry-pi-imager
  rectangle
  sf-symbols
  tableplus
  visual-studio-code
  zoom
)

#--- Update and upgrade existing homebrew recipes and formulae ---#
brew update
brew upgrade

#--- Tap into required repositories ---#
brew tap homebrew/cask-fonts

#--- Begin installing formulae and casks ---#
brew install ${brew[@]}
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install --cask ${cask[@]}

#--- Install Oh My ZSH ---#
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#--- Remove garbage ---#
brew cleanup
brew cleanup -s

echo Done!
