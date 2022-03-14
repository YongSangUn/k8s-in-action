# Building with Proxies

In wsl2:

```bash
$ hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
$ docker build \
    --build-arg http_proxy=${hostip}:7890 \
    --build-arg https_proxy=${hostip}:7890 \
    -t ibo6m/fortune .
```

