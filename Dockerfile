FROM washtubs/env:latest

ADD setup/root/install.sh /root/
ADD setup/root/init.sh /root/

RUN pacman -Syy --noconfirm community/minidlna

RUN chmod +x /root/install.sh
RUN chmod +x /root/init.sh

RUN /root/install.sh

ADD minidlna.conf /config/minidlna.conf

VOLUME /media

RUN chmod -R 775 /config/
RUN chown -R nobody:users /config/

RUN mkdir /home/nobody

EXPOSE 8200/tcp 1900/udp

# run script to set uid, gid and permissions
CMD ["/bin/bash", "/root/init.sh"]
