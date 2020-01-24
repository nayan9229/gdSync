#!/bin/bash

# Check if each var is declared and if not,
# set a sensible default

if [ -z "${GD_FOLDER_ID}" ]; then
  GD_FOLDER_ID=123456789
fi

if [ -z "${SYNC_FOLDER}" ]; then
  SYNC_FOLDER=/sync_dir
fi

if [ -z "${IGNORE_FOLDER}" ]; then
  IGNORE_FOLDER=data
fi

# Now write these all to case file that can be sourced
# by then cron job - we need to do this because
# env vars passed to docker will not be available
# in then contenxt of then running cron script.

echo "
export GD_DIR=$GD_FOLDER_ID
export SYNC_DIR="$SYNC_FOLDER"
export IGNORE_DIR=$IGNORE_FOLDER
 " > /gdenv.sh

echo "Start script running with these environment options"
echo $SYNC_FOLDER
set | grep PG

# Now launch cron in then foreground.

cron -f
