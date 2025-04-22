#!/usr/bin/env bash
set -x
source /etc/backups/backup.env

# Make logs directory
mkdir -p $BACKUPS_DIR/logs
touch $BACKUPS_DIR/logs/$DATE.txt

#Starting backup
echo "-------" $DATE BACKUP START "--------" &>> $BACKUPS_DIR/logs/$DATE.txt

#Restic backup command
restic $DRY_RUN --verbose -r $RESTIC_REPOSITORY \
  backup $BACKUP_PATHS \
  &>> $BACKUPS_DIR/logs/$DATE.txt

echo "-------" $DATE BACKUP PRUNE START "--------" &>> $BACKUPS_DIR/logs/$DATE.txt
#Prune
restic -r $RESTIC_REPOSITORY forget \
  --keep-last $SNAPSHOTS_RETAINED \
  --keep-weekly $WEEKS_RETAINED \
  --keep-monthly $MONTHS_RETAINED \
  --keep-yearly $YEARS_RETAINED $DRY_RUN \
  --prune \
    &>> $BACKUPS_DIR/logs/$DATE.txt
#End backup
echo "-------" $DATE BACKUP COMPLETE "--------" &>> $BACKUPS_DIR/logs/$DATE.txt


