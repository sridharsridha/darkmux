#!/bin/bash -

# Unoffical Bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/

# Install tmux
echo "Installing tmux configuration..."
echo
if [[ ! -z "$TMUX" ]] && [[ -n "$TMUX" ]]; then
   echo
   echo "=====NOTICE==========================================================="
   echo "Running this script inside tmux session will kill your tmux session!.."
   echo "This is needed for installing tmux plugins"
   echo "======================================================================"
   echo
   read -p "Are you okay with killing your current tmux session? [y/n]: " -n 1 -r
   echo
   if [[ $REPLY =~ ^[Yy]$ ]]; then
		echo
		echo "Installing... tmux will exit..."
		echo
   else
		echo
      echo "Sayonara!..."
		echo
		exit 1
   fi
fi

echo ln -s ${PWD}/tmux.conf ~/.tmux.conf
ln -s ${PWD}/tmux.conf ~/.tmux.conf

echo
echo "Installing plugins"
echo
# start a server but don't attach to it
tmux start-server
# create a new session but don't attach to it either
tmux new-session -d
# install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh
# killing the server is not required, I guess
tmux kill-server

echo
echo "Done..."
