##
1. wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.14.tar.gz
2. tar -xvf elasticsearch-5.6.14.tar.gz
3. `groupadd elasticsearch`
4. `useradd -g elasticsearch elasticsearch`
5. 调大文件句柄(软限制要小于等于硬限制,重新登录即生效)：`vim /etc/security/limits.conf`
```
# End of file
* soft noproc 102400 #软限制
* hard noproc 201400 #硬限制
* soft nofile 102400 #软限制
* hard nofile 102400 #硬限制
```
6. 调整内存权限：`vim /etc/sysctl.conf`
  a. 查看`sysctl -a|grep vm.max_map_count`
  b. 在文件最后添加一行`vm.max_map_count=262144`
