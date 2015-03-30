FROM ubuntu:14.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install wget

RUN export DEBIAN_FRONTEND=noninteractive && \
    cd /tmp && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update && \ 
    apt-get -y install google-chrome-stable

RUN export uid=1000 gid=1000 && user=chrome && \
    mkdir -p /home/${user} && \
    echo "${user}:x:${uid}:${gid}:${user},,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user}/.config/google-chrome && \
    touch /home/${user}/.config/google-chrome/First\ Run && \
    chown ${uid}:${gid} -R /home/${user}

RUN export DEBIAN_FRONTEND=noninteractive && apt-get -y install pulseaudio

COPY container /

USER chrome
ENV HOME /home/chrome
CMD /usr/bin/run-chrome-inside-container red
