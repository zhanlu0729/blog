### Uninstall old versions
```
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
``
                 
### Install Docker
```
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
  
  sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
    
    sudo yum-config-manager --enable docker-ce-edge
    
    sudo yum-config-manager --enable docker-ce-test
```
                 
