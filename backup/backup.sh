#!/bin/sh

# Taken from http://blog.interlinked.org/tutorials/rsync_time_machine.html

# Edit these
SRCDIR=test
DESTHOST=hydrogen.local
DESTDIR=/media/Paris/bak

# Do not edit below
SRCHOST=${HOSTNAME%.local}
BACKUPPATH=$DESTDIR/$SRCHOST

date=`date "+%Y-%m-%d-%H%M%S"`

ssh $DESTHOST "mkdir -p $BACKUPPATH"

rsync \
	-azP \
	--delete \
	--delete-excluded \
	--link-dest=$BACKUPPATH/current \
	$SRCDIR $DESTHOST:$BACKUPPATH/$date

ssh $DESTHOST "\
	rm -f $BACKUPPATH/current \
	&& ln -s $BACKUPPATH/$date $BACKUPPATH/current \
	"
