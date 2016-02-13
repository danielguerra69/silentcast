FROM ubuntu:14.04
MAINTAINER Daniel Guerra
RUN apt-get -yy update
RUN apt-get -y install --no-install-recommends software-properties-common firefox ca-certificates supervisor openbox xvfb x11vnc xterm xfce4-terminal docker vim
RUN add-apt-repository ppa:sethj/silentcast
RUN apt-get -yy update
RUN apt-get -yy install silentcast
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /home/silentcast
RUN addgroup silentcast
RUN useradd -m -g silentcast -s /bin/bash silentcast
RUN echo "set passwd"
RUN echo "silentcast:silentcast" > /tmp/pass && /usr/sbin/chpasswd < /tmp/pass
RUN echo "silentcast    ALL=(ALL) ALL" >> /etc/sudoers
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD menu.xml /etc/xdg/openbox/menu.xml
RUN chown silentcast:silentcast /usr/bin/silentcast*
RUN chown -R silentcast:silentcast /home/silentcast
WORKDIR /home/silentcast
ENV DISPLAY :1
ADD start /bin/start
RUN update-alternatives --config x-www-browser
EXPOSE 5900
CMD ["/bin/start"]
