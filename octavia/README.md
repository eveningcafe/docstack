## Octavia service
### Note:
- Please edit base images url, tag before build
- Install octavia for controller
- From 1.0 version, Octavia do not nead neutron-lbaas
- Share config folder: /usr/share/docker

### Build:
```
docker build -t docker-registry:4000/octavia:<tag> --build-arg http_proxy=http://192.168.5.8:3128 --build-arg https_proxy=http://192.168.5.8:3128 .
docker push docker-registry:4000/octavia:<tag>
```

### Bootstrap or upgrade
```
docker run -d --name <container-name> --network=host --privileged --user octavia -v /var/log/octavia:/var/log/octavia -v /var/lib/octavia:/var/lib/octavia -v /usr/share/docker/:/usr/share/docker/ -v /etc/localtime:/etc/localtime -e OCTAVIA_START='BOOTSTRAP' docker-registry:4000/octavia:<tag>
```

### Run Octavia api
```
docker run -d --name <container-name> --network=host --restart unless-stopped --privileged --user octavia -v /var/log/octavia:/var/log/octavia -v /var/lib/octavia:/var/lib/octavia -v /usr/share/docker/:/usr/share/docker/ -v /etc/localtime:/etc/localtime -e OCTAVIA_START='START_OCTAVIA_API' docker-registry:4000/octavia:<tag>
```

### Run Octavia worker
```
docker run -d --name <container-name> --network=host --restart unless-stopped --privileged --user octavia -v /var/log/octavia:/var/log/octavia -v /var/lib/octavia:/var/lib/octavia -v /usr/share/docker/:/usr/share/docker/ -v /etc/localtime:/etc/localtime -e OCTAVIA_START='START_OCTAVIA_WORKER' docker-registry:4000/octavia:<tag>
```

### Run Octavia healthmanager
```
docker run -d --name <container-name> --network=host --restart unless-stopped --privileged --user octavia -v /var/log/octavia:/var/log/octavia -v /var/lib/octavia:/var/lib/octavia -v /usr/share/docker/:/usr/share/docker/ -v /etc/localtime:/etc/localtime -e OCTAVIA_START='START_OCTAVIA_HEALTH_MANAGER' docker-registry:4000/octavia:<tag>
```

### Run Octavia Housekeeping
```
docker run -d --name <container-name> --network=host --restart unless-stopped --privileged --user octavia -v /var/log/octavia:/var/log/octavia -v /var/lib/octavia:/var/lib/octavia -v /usr/share/docker/:/usr/share/docker/ -v /etc/localtime:/etc/localtime -e OCTAVIA_START='START_OCTAVIA_HOUSEKEEPING' docker-registry:4000/octavia:<tag>
```
