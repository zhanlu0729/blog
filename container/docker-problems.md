### 镜像拉取失败
错误描述：`Error response from daemon: Get https://k8s-registry.banksteel.local/v`
原因分析：
解决方案：
```
a. vi /usr/lib/systemd/system/docker.service
b. ExecStart=/usr/bin/dockerd --insecure-registry k8s-registry.banksteel.local
```
