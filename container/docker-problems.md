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
或者修改 `/etc/docker/daemon.json`文件`{"insecure-registries":["domain", "ip"]}`

### Harbor
1. 错误描述：推送镜像时报：denied: requested access to the resource is denied
2. 原因分析：
3. 解决方案：harbor上没有对应的project，创新并公开即可


### Pod报镜像拉取失败错误，镜像又真实存在
1. 错误描述：Error syncing pod, skipping: failed to "StartContainer" for "POD" with ImagePullBackOff: Back-off pulling image "registry.access.redhat.com/rhel7/pod-infrastructure:latest"
2. 原因分析：Node节点环境问题
3. 解决方案：yum install *rhsm* -y
