docker run -ti \
    --net="host" \
    -v /mnt/media:/media \
    -v /etc/localtime:/etc/localtime:ro \
    -e PUID=1000 \
    -e PGID=1000 \
    washtubs/minidlna zsh
