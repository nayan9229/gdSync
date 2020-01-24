#!/bin/bash

docker run --name="gd-sync"\
    -e "GD_FOLDER_ID=123123123" \
    -e "IGNORE_FOLDER=oz_scheduler" \
    -v /home/oizom/Documents/oizom/oz_local:/sync_dir \
    -v /gdrive_config.json:$YOUR_GDRIVR_CONFIG_FILE_PATH \
    -i -d nayan9229/gd-sync:latest
