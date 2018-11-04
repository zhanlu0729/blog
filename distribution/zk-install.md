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
``initLimit`` 这个配置项是用来配置ZooKeeper接受客户端（这里所说的客户端不是用户连接ZooKeeper服务器的客户端，而是ZooKeeper服务器集群中连接到``Leader``的``Follower``服务器）初始化连接时最长能忍受多少个心跳时间间隔数。当已经超过5个心跳的时间（也就是``tickTime``）长度后ZooKeeper服务器还没有收到客户端的返回信息，那么表明这个客户端连接失败。总的时间长度就是``5*2000=10``秒
``syncLimit`` 这个配置项标识``Leader``与``Follower``之间发送消息，请求和应答时间长度。如果``Follower``在设置时间内不能与``Leader``通信，那么此``Follower``将被丢弃。最长不能超过多少个tickTime的时间长度，总的时间长度就是``2*2000=4``秒

5. ``minSessionTimeout`` 最小的会话超时时间，最小的会话超时时间默认情况下为2倍的tickTme时间
6. ``maxSessionTimeout`` 最大的会话超时时间，最大的会话超时时间默认情况下为20倍的tickTme时间

### 单机模式

### 伪集群模式

### 集群模式
