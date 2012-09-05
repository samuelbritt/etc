#!/bin/bash

# install first because they are interactive
# apt-get install -y			\
#         ddclient			\
#         ubuntu-restricted-extras	\

# install these so we can start doing work
apt-get install -y			\
	vim-gnome			\
	git				\
	mercurial			\

# now the rest
# apt-add-repository ppa:stebbins/handbrake-releases
# apt-add-repository ppa:stebbins/handbrake-snapshots
apt-get update

apt-get install -y			\
	ipython                         \
	python-scipy                    \
	python-matplotlib               \
	python-virtualenv               \
	inkscape                        \
	vlc                             \
	htop                            \
	tree                            \
	openssh-server                  \
	network-manager-vpnc            \
	exuberant-ctags                 \
	ctags				\
	colordiff			\
	colormake			\
	colorgcc			\
	ruby				\
	ruby-dev			\
	rake				\
	valgrind			\

	## Others?
	# chromium-browser		\
	# engauge-digitizer		\
	# nautilus-open-terminal	\
	# compizconfig-settings-manager	\
	# qalculate-gtk			\
	# electricsheep			\
	# gtk2-engines-pixbuf		\
	# terminator			\
	# scribus-ng			\
	# scribus-ng-doc		\
	# gimp				\
	# gnome-do			\
	# libdvdread4			\
	# gstreamer0.10-plugins-bad	\
	# gstreamer0.10-plugins-ugly	\
	# backintime-gnome		\
	# deja-dup			\
	# handbrake			\
	# gnome-gmail			\

# install LaTeX last b/c it takes forever
apt-get install -y			\
	latexmk				\
	texlive				\
	texlive-latex-recommended	\
	texlive-bibtex-extra            \
	texlive-math-extra              \
	texlive-publishers              \
	texlive-science                 \

# Enable dvd playback
# /usr/share/doc/libdvdread4/install-css.sh

echo
echo "Now that the install is done, be sure to install these from the web:"
echo "Virtualbox (http://www.virtualbox.org/wiki/Linux_Downloads)"
echo "Chrome (http://www.google.com/chrome)"
echo "Eclipse (http://eclipse.org/downloads/)"
echo "EPD (http://www.enthought.com/products/edudownload.php)"
