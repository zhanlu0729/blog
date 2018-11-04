## 安装步骤
### 准备工作
1. 安装对应的JDK版本，建议安装JDK7+
2. `export JAVA_HOME=/usr/local/jdk-version`
3. `export ZOOKEEPER_HOME=/usr/local/zookeeper-version`
4. `export PATH=$PATH:$JAVA_HOME/bin:$ZOOKEEPER_HOME/bin`

### 配置项详解
1. ``clientPort`` 监听客户端连接的端口
2. ``dataDir`` 存储内存中数据库快照的位置
3. ``dataLogDir`` 存储ZK日志的位置
4. ``maxClientCnxns`` 限制连接到ZooKeeper客户端的数量，限制并发连接的数量，它通过IP来区分不同的客户端。此配置选项可以用来阻止某些类别的Dos攻击。将它设置为0或者忽略而不进行设置将会取消对并发连接的限制
5. ``tickTime`` 基本事件单元，以毫秒为单位。这个时间是作为ZooKeeper服务器之间或客户端与服务器之间维持心跳的时间间隔，也就是每个tickTime时间就会发送一个心跳
6. ``initLimit`` 这个配置项是用来配置ZooKeeper接受客户端（这里所说的客户端不是用户连接ZooKeeper服务器的客户端，而是ZooKeeper服务器集群中连接到``Leader``的``Follower``服务器）初始化连接时最长能忍受多少个心跳时间间隔数。当已经超过5个心跳的时间（也就是``tickTime``）长度后ZooKeeper服务器还没有收到客户端的返回信息，那么表明这个客户端连接失败。总的时间长度就是``5*2000=10``秒
7. ``syncLimit`` 这个配置项标识``Leader``与``Follower``之间发送消息，请求和应答时间长度。如果``Follower``在设置时间内不能与``Leader``通信，那么此``Follower``将被丢弃。最长不能超过多少个tickTime的时间长度，总的时间长度就是``2*2000=4``秒
8. ``server.A=B：C：D`` 其中``A``是一个数字，表示这个是第几号服务器；``B``是这个服务器的ip地址；``C``表示的是这个服务器与集群中的Leader服务器交换信息的端口；``D``表示的是万一集群中的Leader服务器挂了，需要一个端口来重新进行选举，选出一个新的``Leader``，而这个端口就是用来执行选举时服务器相互通信的端口。如果是伪集群的配置方式，由于``B``都是一样，所以不同的ZooKeeper实例通信端口号不能一样，所以要给它们分配不同的端口号
9. ``minSessionTimeout``和``maxSessionTimeout``最小的会话超时时间以及最大的会话超时时间。其中，最小的会话超时时间默认情况下为2倍的``tickTme``时间，最大的会话超时时间默认情况下为20倍的会话超时时间。在启动时，系统会显示相应信息，默认会话超时时间；在配置``minSessionTmeout``以及``maxSessionTimeout``的值的时候需要注意，如果将此值设置的太小的话，那么会话很可能刚刚建立便由于超时而不得不退出。一般情况下，不能将此值设置的``tickTime``的值还小
10. ``autopurge.purgeInterval``和``autopurge.snapRetainCount``从版本3.4.0 开始，Zookeeper提供了自动清理快照（snapshot）和事务日志的功能，需要在``zoo.cfg``配置文件中设置；其中，``autopurge.purgeInterval``这个参数制定了持久化日志清理频率，单位是小时，默认是``0``，表示不开启自动清理功能；``autopurge.snapRetainCount``这个参数和前面的参数搭配使用，用于指定需要保留的持久化日志的文件数目，默认是保留3个

### 单机模式
1. **解压** ``tar -zxvf zookeeper-3.4.6.tar.gz``
2. **建立软链接,便于升级** ``ln -s zookeeper-3.4.6 zookeeper``
3. 拷贝ZooKeeper-3.4.6/conf中的``zoo_sample.cfg``为``zoo.cfg``
4. 在``dataDir``目录下创建``myid``文件,内容为实例``编号``
5. 最终配置文件内容：
```
  tickTime=2000 
  dataDir=/data/zk 
  clientPort=2181
```
6. **启动** ``zkServer.sh {start|start-foreground|stop|restart|status|upgrade|print-cmd}``
7. **检查启动状态** ``zkServer.sh status``

### 伪集群模式
1. 安装参考单机模式
2. 最终配置文件内容：
```
  server.1=IP:2887:3887 
  server.2=IP:2888:3888 
  server.3=IP:2889:3889
```
3. **启动**
```
zkServer.sh start zoo1.cfg 
zkServer.sh start zoo2.cfg 
zkServer.sh start zoo3.cfg
```

### 集群模式
1. 安装参考单机模式
2. 最终配置文件内容：
```
  server.1=IP1:2888:3888 
  server.2=IP2:2888:3888 
  server.3=IP3:2888:3888
```
3. **启动**
```
zkServer.sh start [zoo.cfg]
```

### 客户端四字命令
1. ``conf`` 输出相关服务配置的详细信息。 
2. ``cons`` 列出所有连接到服务器的客户端的完全的``连接/会话``的详细信息。包括``接受/发送``的包数量、会话id、操作延迟、最后的操作执行等等信息。 
3. ``dump`` 列出未经处理的会话和临时节点。 
4. ``envi`` 输出关于服务环境的详细信息（区别于``conf``命令）。 
5. ``reqs`` 列出未经处理的请求 
6. ``ruok`` 测试服务是否处于正确状态。如果确实如此，那么服务返回``imok``，否则不做任何相应
7. ``stat`` 输出关于性能和连接的客户端的列表。 
8. ``wchs`` 列出服务器``watch``的详细信息。 
9. ``wchc`` 通过session列出服务器``watch``的详细信息，它的输出是一个与watch相关的会话的列表
10. ``wchp`` 通过路径列出服务器watch的详细信息。它输出一个与session相关的路径
11. ''zkCli.sh [-server ip:port]``
