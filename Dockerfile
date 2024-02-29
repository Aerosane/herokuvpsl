FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt install curl -y
RUN curl 'https://raw.githubusercontent.com/dev-extended/https-github.com-developeranaz-Ubuntu-Desktop-noVNC-Heroku-VPS-tree-ex/main/install.sh' |bash
COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

RUN apt-get update && apt-get upgrade -y
RUN wget http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_121.0.6167.184-1_amd64.deb
RUN apt install ./google-chrome-stable_121.0.6167.184-1_amd64.deb -y
RUN apt update && apt upgrade -y

CMD ["/system/supervisor.sh"]
