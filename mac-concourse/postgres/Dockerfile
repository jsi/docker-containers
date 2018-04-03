FROM postgres:9.4.1

COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d

COPY backup-restore.sh /usr/local/bin/backup-restore.sh
COPY backup-pre.sh /usr/local/bin/backup-pre.sh
COPY backup-post.sh /usr/local/bin/backup-post.sh
RUN chmod +x /usr/local/bin/backup-*.sh
RUN mkdir /backup
