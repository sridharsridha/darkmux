#!/bin/bash -

# Unoffical Bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\t\n' # Stricter IFS settings
ORIGINAL_IFS=$IFS

# Install tmux
echo "Installing tmux configuration..."
echo ln -s ${PWD}/tmux.conf ~/.tmux.conf
ln -s ${PWD}/tmux.conf ~/.tmux.conf
