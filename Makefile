run-py:
        docker run -d  --net=host \
        -v /opt/python/:/app/ \
        -v  /var/log/python3.9:/app/logs  \
        --name python3.9 python3.9:2.0
stop-py:
        docker stop python3.9
        docker rm python3.9
exec:
        docker exec -it python3.9 /bin/bash
build:
        docker build -t python3.9:2.0 -f Dockerfile .