### 镜像拉取失败
1. 错误描述：`Error response from daemon: Get https://k8s-registry.banksteel.local/v`
2. 原因分析：
3. 解决方案：
```
$ vi /usr/lib/systemd/system/docker.service
$ ExecStart=/usr/bin/dockerd --insecure-registry k8s-registry.banksteel.local
$ systemctl daemon-reload
$ systemctl restart docker
```
