#!/bin/bash

#
# Installs all the dot-files (symlinks) to their appropriate locations
#

cd ${HOME}

# Bash
ln -sf etc/bash/bashrc .bashrc
ln -sf etc/bash/bash_aliases .bash_aliases
ln -sf etc/bash/inputrc .inputrc
if [[ `uname` == "Darwin" ]]
then
	ln -sf etc/bash/bash_profile .bash_profile
fi

# Vim
ln -sfT etc/vim/vim .vim
ln -sf etc/vim/vimrc .vimrc
mkdir -p ~/.swp
if [[ `uname` == "Linux" ]]
then
	if [[ `uname -n` == hydrogen* ]]
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
hash rake 2>/dev/null || {
	sudo apt-get install ruby ruby-dev rake;
}
cd $HOME/.vim/bundle/command-t
rake make
cd $HOME

# install git if needed
hash git 2>/dev/null || {
	sudo apt-get install git;
}
cd $HOME/.vim/bundle/pyflakes
git submodule init
git submodule update
cd $HOME

# Hg
ln -sf etc/hg/hgrc .hgrc
ln -sf etc/hg/hgrc_ignore .hgrc_ignore

# LaTeX
if [[ `uname` = "Linux" ]]
then
	ln -sfT etc/texmf texmf
elif [[ `uname` = "Darwin" ]]
then
	ln -sfT ~/Library/texmf texmf
fi


# Eclipse
ln -sf etc/eclipse/vrapperrc .vrapperrc

# Screen
ln -sf etc/screen/screenrc .screenrc
ln -sfT etc/screen/screen-profiles .screen-profiles

# Abaqus
if   type -P abaqus &>/dev/null || [[ `uname -n` == "titanium"  ]]
then
	ln -sf etc/abaqus/abaqus_v6.env abaqus_v6.env
fi

# SSH
mkdir -p .ssh
cd .ssh
ln -sf ../etc/ssh/config config
cd $HOME

# Fonts
unzip etc/fonts/*zip
mkdir -p .fonts
mv *.otf .fonts

# Clean up home
# mkdir -p media
# sudo rm -rf Templates Public
# sudo mv -n Pictures Videos Music media
