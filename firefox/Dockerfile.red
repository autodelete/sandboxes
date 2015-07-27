FROM ubuntu:14.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install wget firefox

RUN export uid=1000 gid=1000 && user=chrome && \
    mkdir -p /home/${user} && \
    echo "${user}:x:${uid}:${gid}:${user},,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user}/.config/google-chrome && \
    touch /home/${user}/.config/google-chrome/First\ Run && \
    chown ${uid}:${gid} -R /home/${user}

RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y install pulseaudio

RUN apt-get update
RUN wget https://fpdownload.macromedia.com/get/flashplayer/pdc/11.2.202.457/install_flash_player_11_linux.x86_64.tar.gz && \
    tar -vxzf install_flash_player_11_linux.x86_64.tar.gz && \
    sudo mv libflashplayer.so /usr/lib/firefox-addons/plugins/

COPY container /

USER chrome
ENV HOME /home/chrome
CMD /usr/bin/run-firefox-inside-container red
