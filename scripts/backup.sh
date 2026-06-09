#/bin/sh

# --------------------------------------------------------------------------- #
# Backup
#
# Backup specific directories using Restic over SSH.
# --------------------------------------------------------------------------- #
# Usage: <command>
#
# Commands:
#   init    initialize repository for this machine.
#  	backup  run a backup of this machine.
#   list    list backups in repository for this machine.
# --------------------------------------------------------------------------- #

# --- Configuration ---
# ---------------------
# export BACKUP_NAME=""     # name of host being backed up.
# export BACKUP_SOURCE=""   # path to directories to backup.
# export BACKUP_TARGET=""   # host and directory to backup to.
# export BACKUP_EXCLUDES="" # path to excludes file.

# source above configuration from file.
if [ -f "$HOME/.backup" ]; then
	echo "config from file $HOME/.backup"
	source "$HOME/.backup"
fi

# --- Script ---
# --------------

# check configuration is set.
if [[ "$BACKUP_NAME" == "" ]]; then
	echo "config: BACKUP_NAME not set"
	exit 2
elif [[ "$BACKUP_SOURCE" == "" ]]; then
	echo "config: BACKUP_SOURCE not set"
	exit 2
elif [[ "$BACKUP_TARGET" == "" ]]; then
	echo "config: BACKUP_TARGET not set"
	exit 2
elif [[ "$BACKUP_EXCLUDES" == "" ]]; then
	echo "config: BACKUP_EXCLUDES not set"
	exit 2
fi

# set environment variables for restic.
export RESTIC_HOST="$BACKUP_NAME"
export RESTIC_REPOSITORY="sftp:$BACKUP_TARGET"

# run command.
case $1 in
	init)
		restic init
	;;

	backup)
		restic backup --exclude-file $BACKUP_EXCLUDES $BACKUP_SOURCE
	;;

	list)
		restic snapshots
	;;

	*)
		if [[ "$1" == "" ]]; then
			echo "command required: init, run or list"
			exit 2
		else
			echo "unknown command: $1"
			exit 1
		fi
	;;
esac
