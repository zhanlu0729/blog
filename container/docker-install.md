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
安装这一步如果出现大量的`[Errno 12] Timeout on http`异常，安装如下包：
```
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum provides '*/applydeltarpm'
yum install deltarpm -y
yum clean all
yum makecache
如果安装依然失败，手工安装deltarpm,然后yum provides '*/applydeltarpm'
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

### install Docker-Compose
1. curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose #下载并安装compose
2. sudo chmod +x /usr/local/bin/docker-compose #修改文件的可执行权限
3. docker-compose --version #查看是否安装成功
### install harbor
1. 配置harbor.cfg
2. sudo ./install.sh #安装
3. sudo ./install.sh [Step 0]: checking installation environment … Note: docker version: 17.06.0 ✖ Need to install docker-compose(1.7.1+) by yourself first and run this script again.
```
需要换成另外一种安装方法：sudo ./prepare，然后在执行：docker-compose up -d
```
4. 默认用户名：admin 密码：Harbor12345
    
### Stopping Harbor:
sudo docker-compose stop
### Restarting Harbor after stopping:
sudo docker-compose start
### To change Harbor's configuration, first stop existing Harbor instance and update harbor.cfg. Then run prepare script to populate the configuration. Finally re-create and start Harbor's instance:
```
$ sudo docker-compose down -v
$ vim harbor.cfg
$ sudo prepare
$ sudo docker-compose up -d
```
