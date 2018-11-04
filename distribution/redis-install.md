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
1. ``port`` 监听端口，默认为6379
2. ``logfile`` 配置log文件地址，默认使用标准输出，即打印在命令行终端的端口上
3. ``dir`` 数据库镜像备份的文件放置的路径(存放持久化文件和日志文件)
4. ``daemonize`` 是否以守护进程方式启动，如是把该项的值改为yes
5. ``pidfile`` 把pid文件放在/var/run/redis.pid，可以配置到其他地址
6. ``bind`` 指定redis只接收来自该IP的请求，如果不设置，那么将处理所有请求，在生产环节中最好设置该项
7. ``timeout`` 设置客户端连接时的超时时间，单位为秒
8. ``loglevel`` 等级分为4级，debug，revbose，notice和warning。生产环境下一般开启notice
9. ``database`` 设置数据库的个数，默认使用的数据库是0
10. ``save`` 设置redis进行数据库镜像的频率
11. rdbcompression`` 在进行镜像备份时，是否进行压缩
12. ``dbfilename`` 镜像备份文件的文件名
13. ``slaveof`` 设置该数据库为其他数据库的从数据库
14. ``masterauth`` 当主数据库连接需要密码验证时，在这里设定
15. ``requirepass`` 设置客户端连接后进行任何其他指定前需要使用的密码
16. ``maxclients`` 限制同时连接的客户端数量
17. ``maxmemory：设置redis能够使用的最大内存
18. ``appendonly：开启appendonly模式后，redis会把每一次所接收到的写操作都追加到appendonly.aof文件中，当redis重新启动时，会从该文件恢复出之前的状态
19. ``appendfsync`` 设置appendonly.aof文件进行同步的频率
20. ``vm_enabled`` 是否开启虚拟内存支持
21. ``vm_swap_file`` 设置虚拟内存的交换文件的路径
22. ``vm_max_momery`` 设置开启虚拟内存后，redis将使用的最大物理内存的大小，默认为0
23. ``vm_page_size`` 设置虚拟内存页的大小
24. ``vm_pages`` 设置交换文件的总的page数量
25. ``vm_max_thrrads`` 设置vm IO同时使用的线程数量

### 单机模式
1. **下载** ``wget http://download.redis.io/releases/redis-3.2.2.tar.gz``
2. **解压** ``tar -zxvf redis-3.2.2.tar.gz``
3. **建立软链接,便于升级** ``ln -s redis-3.2.2 redis``
4. **配置：可省略** ``./configure``
5. **安装** ``make && make install``
6. **启动：默认配置** ``./redis-server``
7. **启动：运行配置** ``./redis-server --configKey1 value1 --configKey2 value2``
8. **启动：配置文件** ``./redis-server /configFile``
9. **关闭：粗暴关闭** ``kill -9 pid``
10. **关闭：优雅关闭** ``redis-cli shundown nosave|save`` 关闭前是否生成持久化文件，默认生成

### 主从模式
1. 
2. 

### 哨兵模式
1. 
2. 

### 集群模式
1. 
2.
