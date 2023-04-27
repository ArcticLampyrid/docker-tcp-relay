# docker-tcp-relay
![Docker Pulls](https://img.shields.io/docker/pulls/qiqiworld/tcp-relay)  
A docker image for [tcp-relay-rust](https://github.com/cedric05/tcp-relay-rust), which can create simple tcp proxy.

```bash
docker run -p 443:443 qiqiworld/docker-tcp-relay "192.168.1.1:443" "0.0.0.0:443"
```