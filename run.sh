# TODO: net=host is insecure but it's needed because docker doesnt support "multicast"
docker run -d \
    -p=1900:1900/udp -p=8200:8200/tcp \
    --net=host \
    --name=minidlna \
    -v /mnt/media:/media \
    -v /etc/localtime:/etc/localtime:ro \
    -e PUID=1000 \
    -e PGID=1000 \
    washtubs/minidlna
