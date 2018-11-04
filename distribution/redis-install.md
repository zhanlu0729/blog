## 安装
### redis/bin中文件介绍
1. ``redis-server`` 启动Redis
2. ``redis-cli`` Redis命令行客户端
3. ``redis-benchmark`` Redis基准测试工具
4. ``redis-check-aof`` Redis AOF持久化文件检测和修复工具
5. ``redis-check-rdb`` Redis RDB持久化文件检测和修复工具
6. ``redis-sentinel`` 启动Redis Sentinel

### 单机模式
1. **下载** wget http://download.redis.io/releases/redis-3.2.2.tar.gz
2. **解压** tar -zxvf redis-3.2.2.tar.gz
3. **建立软链接,便于升级** ln -s redis-3.2.2 redis
4. **配置** ./configure
5. **安装** make && make install
6. **启动** ./redis-server

### 主从模式
1. 
2. 

### 哨兵模式
1. 
2. 

### 集群模式
1. 
2.
