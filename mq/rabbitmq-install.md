## 安装 openssl
1. ``wget http://mirrors.ibiblio.org/openssl/source/old/1.0.2/openssl-1.0.2.tar.gz`` 下载
2. ``tar -zvxf openssl-1.0.2.tar.gz``
3. ``cd openssl-1.0.2``
4. ``./config --prefix=/usr/local/openssl``
5. ``vi Makefile``将原来的：``CFLAG= -DOPENSSL_THREADS``修改为： ``CFLAG= -fPIC -DOPENSSL_THREADS``
6. ``make && make install``

## 安装erlang
1. 下载``otp_src_20.3.tar.gz``
2. ``tar -zxvf otp_src_20.3.tar.gz``
3. ``cd otp_src_20.3``
4. ``./configure --prefix=/usr/local/erlang --without-javac --with-ssl=/usr/local/openssl``
5. 如果报``configure: error: No curses library functions found``，则``yum -y install ncurses-devel``
6. ``make && make install``
7. ``export ERLANG_HOME=/usr/local/erlang``
8. ``export PATH=$PATH:$ERLANG_HOME/bin``
9. ``erl`` 验证是否安装成功

## 安装RabbitMQ
1. 下载``rabbitmq-server-generic-unix-3.6.16.tar.xz``
2. ``tar -xvf rabbitmq-server-generic-unix-3.6.16.tar.xz -C /opt``
3. ``cd opt``
4. ``mv rabbitmq-server-3.6.16 rabbitmq``
5. ``export RABBITMQ_HOME=/usr/local/rabbitmq``
6. ``export PATH=$PATH:$RABBITMQ_HOME/sbin``
7. ``rabbitmq-plugins enable rabbitmq_management`` 开启管理后台插件
8. ``rabbitmq-server -detached`` 以守护进程运行
9. ``rabbitmqctl status`` 检查进程运行状态

## 安装RabbitMQ集群
1. 启动Master节点
2. 复制Master节点的/{user}/.erlang.cookie到各从节点
3. 停止从节点进程,再重启``rabbitmq-server -detached``
4. rabbitmqctl stop_app
5. rabbitmqctl reset
6. rabbitmqctl join_cluster rabbit@master
6. rabbitmqctl start_app

## REST API监控接口
|        URI       |HTTP 请求类型|            接口含义               |
| ---------------- | ---------- | --------------------------------- |
| /api/connections                      |    GET     | 获取当前RabbitMQ集群下所有打开的连接 |
| /api/nodes                            |    GET     | 获取当前RabbitMQ集群下所有节点实例的状态信息 |
| /api/vhosts/{vhost}/connections       |    GET     | 获取某一个虚拟机主机下的所有打开的connection连接 |
| /api/connections/{name}/channels      |    GET     | 获取某一个连接下所有的管道信息 |
| /api/vhosts/{vhost}/channels          |    GET     | 获取某一个虚拟机主机下的管道信息 |
| /api/consumers/{vhost}                |    GET     | 获取某一个虚拟机主机下的所有消费者信息 |
| /api/exchanges/{vhost}                |    GET     | 获取某一个虚拟机主机下面的所有交换器信息 |
|/api/queues/{vhost}                    |        GET     | 获取某一个虚拟机主机下的所有队列信息 |
| /api/users                            |        GET     | 获取集群中所有的用户信息 |
| /api/users/{name}                     | GET/PUT/DELETE | 获取/更新/删除指定用户信息 |
| /api/users/{user}/permissions         |     GET        | 获取当前指定用户的所有权限信息 |
| /api/permissions/{vhost}/{user}       | GET/PUT/DELETE | 获取/更新/删除指定虚拟主机下特定用户的权限 |
| /api/exchanges/{vhost}/{name}/publish |    POST     | 在指定的虚拟机主机和交换器上发布一个消息 |
| /api/queues/{vhost}/{name}/get        |    POST     | 在指定虚拟机主机和队列名中获取消息，同时该动作会修改队列状态 |
| /api/healthchecks/node/{node}         |    GET      | 获取指定节点的健康检查状态 |
