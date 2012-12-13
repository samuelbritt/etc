#!/bin/sh
# Taken from http://blog.interlinked.org/tutorials/rsync_time_machine.html

# To set up as a cron job, first edit the cron table (as root):
#	$ crontab -e
# Then add the following line:
#	20 4 * * * ~/etc/backup/backup.sh
# to run every morning at 4:20 AM.

# Edit these
DESTHOST=hydrogen.local
DESTDIR=/media/Paris/bak

# SRCDIR=$HOME
INCLUDES=$HOME/etc/backup/include
EXCLUDES=$HOME/etc/backup/exclude

# Do not edit below
SRCHOST=${HOSTNAME%.local}
BACKUPPATH=$DESTDIR/$SRCHOST

date=`date "+%Y-%m-%d-%H%M%S"`

ssh $DESTHOST "mkdir -p $BACKUPPATH"

for SRCDIR in `cat $INCLUDES`
do
	echo "Backing up $SRCDIR to $DESTHOST:$BACKUPPATH"
		# --copy-links \
	rsync \
		--dry-run \
		--archive \
		--compress \
		--partial \
		--progress \
		--delete \
		--delete-excluded \
		--exclude-from=$EXCLUDES \
		--link-dest=$BACKUPPATH/current \
		$SRCDIR $DESTHOST:$BACKUPPATH/$date
done

ssh $DESTHOST "\
	rm -f $BACKUPPATH/current \
	&& ln -s $BACKUPPATH/$date $BACKUPPATH/current \
	"
