##
1. wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.14.tar.gz
2. tar -xvf elasticsearch-5.6.14.tar.gz
3. `groupadd elasticsearch`
4. `useradd -g elasticsearch elasticsearch`
5. 调整系统用户的文件句柄限制(软限制要小于等于硬限制,重新登录即生效)：`vim /etc/security/limits.conf`
```
# End of file
* soft noproc 102400 #软限制
* hard noproc 201400 #硬限制
* soft nofile 102400 #软限制
* hard nofile 102400 #硬限制
```
6. 调整系统用户的内存限制：`vim /etc/sysctl.conf`
```
执行命令：sysctl -w vm.max_map_count=262144
查看：sysctl -a|grep vm.max_map_count
# 在文件最后添加一行,永久生效
vm.max_map_count=262144
```
7. `su -c '$ES_HOME/bin/elasticsearch -d' elasticsearch` 启动


## elasticsearch-head安装
1. `git clone git://github.com/mobz/elasticsearch-head.git` 下载
2. `cd elasticsearch-head`
3. `npm install -g grunt-cli` 安装grunt-cli
4. `npm install grunt --save` 安装grunt
5. `npm install` 安装依赖的npm包
npm install -g cnpm --registry=https://registry.npm.taobao.org
4. `nohup npm run start &`
