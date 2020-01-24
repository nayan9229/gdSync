#!/bin/bash

docker run --name="gd-sync"\
    -e "GD_FOLDER_ID=123123123" \
    -e "IGNORE_FOLDER=data" \
    -v /home/oizom/Documents/oizom/oz_local:/sync_dir \
    -v $YOUR_GDRIVR_CONFIG_FILE_PATH:/gdrive_config.json \
    -i -d nayan9229/gd-sync:latest
