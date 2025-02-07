#!/bin/bash

# This script is used to run the daily cron job.
# at 18:00 every day (UTC+6)
#
# This script is meant to be run from the crontab.
#

OUTPUT="$(date +%Y-%m-%d).png"

# get script location
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $SCRIPT_DIR/screenshots

$SCRIPT_DIR/.venv/bin/python $SCRIPT_DIR/make_screenshot.py --output $SCRIPT_DIR/screenshots/$OUTPUT

cd $SCRIPT_DIR

git add .
git commit -m "Daily screenshot at $(date +%Y-%m-%d)" 
git push
