#!/bin/bash

#
# Installs all the dot-files (symlinks) to their appropriate locations
#

cd ${HOME}

# Bash
ln -sf etc/bash/bashrc .bashrc
ln -sf etc/bash/bash_aliases .bash_aliases
ln -sf etc/bash/inputrc .inputrc

# Vim
ln -sf etc/vim/vim .vim
ln -sf etc/vim/vimrc .vimrc
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


# Hg
ln -sf etc/hg/hgrc_ignore .hgrc_ignore
if [[ `uname` = "Linux" ]]
then
	ln -sf etc/hg/hgrc_linux .hgrc
else
	ln -sf etc/hg/hgrc_osx .hgrc
fi

# LaTeX
ln -sf etc/texmf texmf

# Eclipse
ln -sf etc/eclipse/vrapperrc .vrapperrc

# Screen
ln -sf etc/screen/screenrc .screenrc
ln -sf etc/screen/screen-profiles .screen-profiles

# Abaqus
if   type -P abaqus &>/dev/null || [[ `uname -n` == "titanium"  ]]
then
	ln -sf etc/abaqus/abaqus_v6.env abaqus_v6.env
fi

# SSH
cd .ssh
ln -sf ../etc/ssh/config config
