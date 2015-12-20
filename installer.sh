#!/bin/sh

# NEOVIM
REQUIRE_LIBS_APT_NEOVIM="git python python-dev python-pip"
REQUIRE_LIBS_PIP_NEOVIM="neovim"
NEOVIM_PATH="$HOME/.config/nvim"
OLDVIM_PATH="$HOME/.vim"

apt-get install --yes $REQUIRE_LIBS_APT_NEOVIM
pip install $REQUIRE_LIBS_PIP_NEOVIM

# VUNDLE
VUNDLE_PATH="$NEOVIM_PATH/bundle/"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

# YOUCOMPLETEME
# REQUIRE_LIBS_APT_YCM="libclang-dev gocode libclang1-3.6 libjs-sphinxdoc libobjc-5-dev libobjc4 libruby2.1 libyaml-0-2 python-bottle python-concurrent.futures python-jedi python-requests-futures python-waitress ruby ruby2.1 rubygems-integration libboost-all-dev npm"
#
# apt-get install --yes $REQUIRE_LIBS_APT_YCM
#
# npm install -g n
# n stable
#
npm install -g typescript
#
# ./install.py --system-libclang --system-boost --clang-completer --omnisharp-completer --gocode-completer
#
