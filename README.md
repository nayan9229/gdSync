# Docker Google Drive Auto Sync
A simple docker container that runs and sync local folder with google drive folder
By default it will sync with google drive folder once per night (at 23h50m) in a same order as local

## Getting the image

There are various ways to get the image onto your system:


The preferred way (but using most bandwidth for the initial image) is to
get our docker trusted build like this:


```
docker pull nayan9229/gd-sync:latest
```

To build the image yourself without apt-cacher (also consumes more bandwidth
since deb packages need to be refetched each time you build) do:

```
docker build -t nayan9229/gd-sync .
```

If you do not wish to do a local checkout first then build directly from github.

```
git clone
```

## Run


To create a running container do:

```
docker run --name="gd-sync"\
    -e "GD_FOLDER_ID=$YOUR_GDRIVE_FOLDER_ID" \
    -e "IGNORE_FOLDER=data" \
    -v $YOUR_LOCAL_FOLDER_PATH:/sync_dir \
    -v $YOUR_GDRIVR_CONFIG_FILE_PATH:/gdrive_config.json \
    -i -d nayan9229/gd-sync:latest
```

## Specifying environment


You can also use the following environment variables to pass a 
user name and password etc for the database connection.

**Note:** These variable names were changed when updating to support our PG version 10 image so that the names used here are consistent with those used in the postgis v10 image.

* GD_FOLDER_ID: you can add your google drive folder id to sync local folder with your google drive folder.
* IGNORE_FOLDER: you can add local folder name to ignore to sync with your google drive folder.

Example usage:

```
docker run --name="gd-sync"\
    -e "GD_FOLDER_ID=$YOUR_GDRIVE_FOLDER_ID" \
    -e "IGNORE_FOLDER=data" \
    -v $YOUR_LOCAL_FOLDER_PATH:/sync_dir \
    -v $YOUR_GDRIVR_CONFIG_FILE_PATH:/gdrive_config.json \
    -i -d nayan9229/gd-sync:latest
```