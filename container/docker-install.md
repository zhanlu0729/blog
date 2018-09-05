### Uninstall old versions
```
$ sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
```
     
### Install Docker
01. Install required packages. `yum-utils` provides the `yum-config-manager utility`, and `device-mapper-persistent-data` and `lvm2` are required by the `devicemapper` storage driver.
```
$ sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

02. Use the following command to set up the `stable` repository. You always need the `stable` repository, even if you want to install builds from the `edge` or `test` repositories as well.
```
$ sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

03. `Optional`: Enable the `edge` and `test` repositories. These repositories are included in the docker.repo file above but are disabled by default. You can enable them alongside the stable repository.
```
$ sudo yum-config-manager --enable docker-ce-edge
$ sudo yum-config-manager --enable docker-ce-test
$ sudo yum-config-manager --disable docker-ce-edge
```
                 
### 
