#!/bin/sh

REQUIRE_LIBS_APT_NEOVIM="python python-dev python-pip"
REQUIRE_LIBS_PIP_NEOVIM="neovim"
NEOVIM_PATH="$HOME/.config/nvim"
OLDVIM_PATH="$HOME/.vim"

VUNDLE_PATH="$NEOVIM_PATH/bundle/"

REQUIRE_LIBS_APT_YCM="libclang-dev gocode libclang1-3.6 libjs-sphinxdoc libobjc-5-dev libobjc4 libruby2.1 libyaml-0-2 python-bottle python-concurrent.futures python-jedi python-requests-futures python-waitress ruby ruby2.1 rubygems-integration libboost-all-dev"

REQUIRE_LIBS_APT_DUNST=""

./install.py --system-libclang --system-boost --clang-completer --omnisharp-completer --gocode-completer
npm install -g typescript
