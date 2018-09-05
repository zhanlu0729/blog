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
     
### SET UP THE REPOSITORY
01. Install required packages. `yum-utils` provides the `yum-config-manager utility`, and `device-mapper-persistent-data` and `lvm2` are required by the `devicemapper` storage driver.
```
$ sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
```
02. Use the following command to set up the `stable` repository. You always need the `stable` repository, even if you want to install builds from the `edge` or `test` repositories as well.
```
$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```
03. `Optional`: Enable the `edge` and `test` repositories. These repositories are included in the docker.repo file above but are disabled by default. You can enable them alongside the stable repository.
```
$ sudo yum-config-manager --enable docker-ce-edge
```
```
$ sudo yum-config-manager --enable docker-ce-test
```
04. You can disable the `edge` or `test` repository by running the `yum-config-manager` command with the `--disable` flag. To re-enable it, use the `--enable` flag. The following command disables the `edge` repository.
```
$ sudo yum-config-manager --disable docker-ce-edge
```
                 
### INSTALL DOCKER CE
01. Install the latest version of Docker CE, or go to the next step to install a specific version:
```
$ sudo yum install docker-ce
```
02. To install a specific version of Docker CE, list the available versions in the repo, then select and install:

a. List and sort the versions available in your repo. This example sorts results by version number, highest to lowest, and is truncated:
```
$ yum list docker-ce --showduplicates | sort -r

docker-ce.x86_64            18.03.0.ce-1.el7.centos             docker-ce-stable
```
b. Install a specific version by its fully qualified package name, which is the package name (docker-ce) plus the version string (2nd column) up to the first hyphen, separated by a hyphen (-), for example, docker-ce-18.03.0.ce.
```
$ sudo yum install docker-ce-<VERSION STRING>
```
03. Start Docker.
```
$ sudo systemctl start docker
```
04. Verify that docker is installed correctly by running the hello-world image.
```
$ sudo docker run hello-world
```

