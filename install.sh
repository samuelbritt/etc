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
ln -sf etc/bash/bashrc .bashrc
ln -sf etc/bash/bash_aliases .bash_aliases
ln -sf etc/bash/inputrc .inputrc
if [[ $KERNEL == "Darwin" ]]
then
	ln -sf etc/bash/bash_profile .bash_profile
fi

# Vim
ln -sf etc/vim/vim .vim
ln -sf etc/vim/vimrc .vimrc
if [[ $KERNEL == "Linux" ]]
then
	if [[ $HOST == hydrogen* ]]
	then
		ln -sf etc/vim/gvimrc_hydrogen .gvimrc
	else
		ln -sf etc/vim/gvimrc_linux .gvimrc
	fi
else
	ln -sf etc/vim/gvimrc_osx .gvimrc
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
ln -sf etc/hg/hgrc .hgrc
ln -sf etc/hg/hgrc_ignore .hgrc_ignore

# Git
ln -sf etc/git/gitconfig .gitconfig
ln -sf etc/git/gitignore .gitignore
ln -sf etc/git/git-completion.bash .git-completion.sh
ln -sf etc/git/git-prompt.sh .git-prompt.sh

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
	ln -sf $HOME/Dropbox/mendeley/bib $HOME/etc/texmf/bibtex/bib
fi
ln -sf $HOME/etc/texmf $TEXMFDIR

# Eclipse
ln -sf etc/eclipse/vrapperrc .vrapperrc

# Screen
ln -sf etc/screen/screenrc .screenrc
ln -sf etc/screen/screen-profiles .screen-profiles

# SSH
mkdir -p .ssh
cd .ssh
ln -sf ../etc/ssh/config config
cd $HOME

# Synaptics
if [[ $HOST = "helium" ]]
then
	x11conf=/etc/X11/xorg.conf.d/
	sudo mkdir -p $x11conf
	sudo cp etc/X11/xorg.conf.d/60-synaptics.conf $x11conf
fi
