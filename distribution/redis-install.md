## 安装
### redis/bin中文件介绍
1. ``redis-server`` 启动Redis
2. ``redis-cli`` Redis命令行客户端
3. ``redis-benchmark`` Redis基准测试工具
4. ``redis-check-aof`` Redis AOF持久化文件检测和修复工具
5. ``redis-check-rdb`` Redis RDB持久化文件检测和修复工具
6. ``redis-sentinel`` 启动Redis Sentinel
7. **启动错误：Error condition on socket for SYNC: No route to host** ``redis.conf``中``bind``不要绑本机

### Redis配置项说明
1. ``port`` 端口,默认``6379``
2. ``logfile`` 日志文件
3. ``dir`` Redis工作目录(存放持久化文件和日志文件)
4. ``daemonize`` 是否以守护进程方式启动
5. 
6. 

### 单机模式
1. **下载** ``wget http://download.redis.io/releases/redis-3.2.2.tar.gz``
2. **解压** ``tar -zxvf redis-3.2.2.tar.gz``
3. **建立软链接,便于升级** ``ln -s redis-3.2.2 redis``
4. **配置：可省略** ``./configure``
5. **安装** ``make && make install``
6. **启动：默认配置** ``./redis-server``
7. **启动** ``./redis-server --configKey1 value1 --configKey2 value2``
8. **启动：指定默认** ``./redis-server /configFile``

### 主从模式
1. 
2. 

### 哨兵模式
1. 
2. 

### 集群模式
1. 
2.
