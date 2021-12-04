FROM alpine

RUN apk add rsync bash openssh-client

COPY entrypoint /entrypoint
RUN chmod ug+x /entrypoint

COPY test /test
RUN chmod ug+rwX /test

COPY https://raw.githubusercontent.com/laurent22/rsync-time-backup/master/rsync_tmbackup.sh /usr/local/bin/rsync_tmbackup.sh
RUN chmod ug+rwX /usr/local/bin/rsync_tmbackup.sh

RUN chmod g+=rw /etc/passwd
USER 1001
ENTRYPOINT [ "/entrypoint" ]
