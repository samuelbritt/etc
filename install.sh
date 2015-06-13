#!/bin/bash

#
# Installs all the dot-files (symlinks) to their appropriate locations
#

cd ${HOME}/etc
git submodule init
git submodule update

cd ${HOME}

KERNEL=`uname -s`
if [[ 'Cygwin' = `uname -o` ]]
then
	KERNEL='Linux'
fi

HOST=`uname -n`
KDE=$KDE_FULL_SESSION

# Bash
ln -sfn etc/bash/bashrc .bashrc
ln -sfn etc/bash/bash_aliases .bash_aliases
ln -sfn etc/bash/inputrc .inputrc
ln -sfn etc/bash/dircolors .dircolors
ln -sfn etc/bash/bash_profile .bash_profile

# Vim
ln -sfn etc/vim/vim .vim
ln -sfn etc/vim/vimrc .vimrc
if [[ $KERNEL == "Linux" ]]
then
	if [[ $HOST == hydrogen* ]]
	then
		ln -sfn etc/vim/gvimrc_hydrogen .gvimrc
	else
		ln -sfn etc/vim/gvimrc_linux .gvimrc
	fi
else
	ln -sfn etc/vim/gvimrc_osx .gvimrc
fi

# Vim config submodules
# install ruby dev files if needed
# hash rake 2>/dev/null || {
# 	sudo apt-get -y install ruby ruby-dev rake;
# }
# cd $HOME/.vim/bundle/command-t
# rake make
# cd $HOME

# Hg
ln -sfn etc/hg/hgrc .hgrc
ln -sfn etc/hg/hgrc_ignore .hgrc_ignore

# Git
ln -sfn etc/git/gitconfig .gitconfig
ln -sfn etc/git/gitignore .gitignore
ln -sfn etc/git/git-completion.bash .git-completion.sh
ln -sfn etc/git/git-prompt.sh .git-prompt.sh

# LaTeX
if [[ $KERNEL = "Linux" ]]
then
	TEXMFDIR=$HOME/texmf
elif [[ $KERNEL = "Darwin" ]]
then
	TEXMFDIR=$HOME/Library/texmf
fi
# Mendeley handles bibtex files in Dropbox
if [[ -d $HOME/Dropbox ]]
then
	ln -sfn $HOME/Dropbox/mendeley/bib $HOME/etc/texmf/bibtex/bib
fi
ln -sfn $HOME/etc/texmf $TEXMFDIR

# Eclipse
ln -sfn etc/eclipse/vrapperrc .vrapperrc

# Screen
ln -sfn etc/screen/screenrc .screenrc
ln -sfn etc/screen/screen-profiles .screen-profiles

# Tmux
ln -sfn etc/tmux/tmux.conf .tmux.conf
ln -sfn etc/tmux/tmux-completion.sh .tmux-completion.sh

# SSH
mkdir -p .ssh
cd .ssh
ln -sfn ../etc/ssh/config config
cd $HOME

# Synaptics
if [[ $HOST = "helium" ]]
then
	x11conf=/etc/X11/xorg.conf.d/
	sudo mkdir -p $x11conf
	sudo cp etc/X11/xorg.conf.d/60-synaptics.conf $x11conf
fi
