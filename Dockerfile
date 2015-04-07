FROM resin/rpi-raspbian:wheezy

# Install Dropbear.
RUN apt-get update && apt-get install dropbear

ADD start /start

RUN mkdir -p syncthing/syncthingHome
ADD syncthing-linux-arm-v0.10.30.tar.gz /syncthing/syncthing.tar.gz
RUN tar xvzf -C syncthing /syncthing/syncthing.tar.gz
RUN /syncthing/syncthing -home / syncthing/syncthingHome | grep "My ID" > syncthingID.txt

RUN chmod a+x /start

EXPOSE 8080

CMD /start
