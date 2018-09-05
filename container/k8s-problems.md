### k8s外部不能访问pod
1. 问题描述： 在搭建好的k8s集群内创建的容器，只能在其所在的节点上curl可访问，但是在其他任何主机上无法访问容器占用的端口
2. 解决方案:
```
vim /etc/sysctl.conf
找到这一行，放开注释
# Uncomment the next line to enable packet forwarding for IPv4
net.ipv4.ip_forward=1
重启主机（必须要重启才能生效）
```
### 下载镜像出现问题 
问题1：提示/etc/rhsm/ca/redhat-uep.pem no file or dirctory
解决方法： yum安装需要的依赖包 `yum -y install *rhsm*`
