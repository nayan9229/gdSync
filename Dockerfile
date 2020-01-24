FROM debian:stretch-slim
MAINTAINER nayan@oizom.com
 
RUN apt-get -y update; apt-get install -y wget cron
# Install Gdrive on Server
RUN wget https://github.com/gdrive-org/gdrive/releases/download/2.1.0/gdrive-linux-x64
RUN mv gdrive-linux-x64 gdrive
RUN cp gdrive /usr/bin
RUN chmod +x /usr/bin/gdrive
ADD gdrive_config.json /gdrive_config.json

RUN mkdir /sync_dir
ADD backups-cron /etc/cron.d/backups-cron
RUN touch /var/log/cron.log
ADD gdrive.sh /gdrive.sh
ADD start.sh /start.sh

ENTRYPOINT []
CMD ["/start.sh"]
