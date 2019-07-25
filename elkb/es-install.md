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
或者如下：
# 主要是内存限制
elasticsearch soft memlock unlimited 
elasticsearch hard memlock unlimited 
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
1. 下载 `git clone git://github.com/mobz/elasticsearch-head.git`
2. `cd elasticsearch-head`
3. 安装grunt-cli `npm install -g grunt-cli`
4. 安装grunt `npm install grunt --save`
5. 安装依赖的npm包 `npm install`
6. 安装依赖的npm包(下载失败时改用[国内:阿里]) 
  - `npm install -g cnpm --registry=https://registry.npm.taobao.org`
  - `cnpm install`
7. 更改ES配置
```
$ES_HOME/bin/elasticsearch/config/elasticsearch.yml 添加如下配置
http.cors.enabled: true
http.cors.allow-origin: "*"
```
8. 更新elasticsearch-head配置
```
$ES-HEAD_HOME/_site/app.js 做如下更改
this.base_uri = this.config.base_uri || this.prefs.get("app-base_uri") || "http://{ES实际IP}:9200";
```
9. `nohup npm run start &` 启动
