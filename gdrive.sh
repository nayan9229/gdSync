#!/bin/bash

source /gdenv.sh

if [ -z "${IGNORE_DIR}" ]; then
  IGNORE_DIR=data
fi

for f in `eval echo ${SYNC_DIR}/*`; do
    if [ -d ${f} ]; then
        if [ ${f##*/} != ${IGNORE_DIR} ]; then
            echo ${f##*/} >> /var/log/cron.log
            #echo "gdrive --config / --service-account gdrive_config.json sync upload ${f} $GD_DIR >> /var/log/cron.log" >> /var/log/cron.log
            gdrive --config / --service-account gdrive_config.json sync upload ${f} $GD_DIR >> /var/log/cron.log
        fi
    fi
done
