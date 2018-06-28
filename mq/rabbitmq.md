将ebin目录下rabbit.app中loopback_users里的<<"guest">>删除，并重启rabbitmq，可通过任意IP使用guest账号登陆管理控制台，但始终是违背了设计者的初衷，再加上以前对这一块了解也不多，因此有必要总结一下。

## 用户管理
01. **新增一个用户** rabbitmqctl  add_user  Username  Password
02. **删除一个用户** rabbitmqctl  delete_user  Username
03. **修改用户的密码** rabbitmqctl  change_password  Username  Newpassword
04. **查看当前用户列表** rabbitmqctl  list_users

## 用户角色：按照个人理解，用户角色可分为五类，超级管理员, 监控者, 策略制定者, 普通管理者以及其他。
01. **超级管理员(administrator)** 可登陆管理控制台(启用management plugin的情况下)，可查看所有的信息，并且可以对用户，策略(policy)进行操作。
02. **监控者(monitoring)** 可登陆管理控制台(启用management plugin的情况下)，同时可以查看rabbitmq节点的相关信息(进程数，内存使用情况，磁盘使用情况等)
03. **策略制定者(policymaker)** 可登陆管理控制台(启用management plugin的情况下), 同时可以对policy进行管理。但无法查看节点的相关信息(上图红框标识的部分)。
04. **普通管理者(management)** 仅可登陆管理控制台(启用management plugin的情况下)，无法看到节点信息，也无法对策略进行管理。
05. **其他** 无法登陆管理控制台，通常就是普通的生产者和消费者。

设置用户角色的命令为：
rabbitmqctl  set_user_tags  User  Tag
User为用户名， Tag为角色名(对应于上面的administrator，monitoring，policymaker，management，或其他自定义名称)。
也可以给同一用户设置多个角色，例如：rabbitmqctl  set_user_tags  hncscwc  monitoring  policymaker

## 用户权限
用户权限指的是用户对exchange，queue的操作权限，包括配置权限，读写权限。配置权限会影响到exchange，queue的声明和删除。读写权限影响到从queue里取消息，向exchange发送消息以及queue和exchange的绑定(bind)操作。
例如： 将queue绑定到某exchange上，需要具有queue的可写权限，以及exchange的可读权限；向exchange发送消息需要具有exchange的可写权限；从queue里取数据需要具有queue的可读权限。详细请参考官方文档中"How permissions work"部分。

## 相关命令为：
01. **设置用户权限** rabbitmqctl  set_permissions  -p  VHostPath  User  ConfP  WriteP  ReadP
02. **查看(指定hostpath)所有用户的权限信息** rabbitmqctl  list_permissions  [-p  VHostPath]
03. **查看指定用户的权限信息** rabbitmqctl  list_user_permissions  User
04. **清除用户的权限信息** rabbitmqctl  clear_permissions  [-p VHostPath]  User

## 权限控制
01. **创建虚拟主机** rabbitmqctl add_vhost vhostpath
02. **删除虚拟主机** rabbitmqctl delete_vhost vhostpath
03. **列出所有虚拟主机** rabbitmqctl list_vhosts
04. **设置用户权限** rabbitmqctl set_permissions [-p vhostpath] {username} {conf} {write} {read}
05. **清除用户权限** rabbitmqctl clear_permissions [-p vhostpath] {username}
06. **列出虚拟主机上的所有权限** rabbitmqctl list_permissions [-p vhostpath]
07. **列出用户权限** rabbitmqctl list_user_permissions {username}

## 几个概念说明：
01. **Broker** 简单来说就是消息队列服务器实体。
02. **Exchange** 消息交换机，它指定消息按什么规则，路由到哪个队列。
03. **Queue** 消息队列载体，每个消息都会被投入到一个或多个队列。
04. **Binding** 绑定，它的作用就是把exchange和queue按照路由规则绑定起来。
05. **Routing Key** 路由关键字，exchange根据这个关键字进行消息投递。
06. **vhost** 虚拟主机，一个broker里可以开设多个vhost，用作不同用户的权限分离。
07. **producer** 消息生产者，就是投递消息的程序。
08. **consumer** 消息消费者，就是接受消息的程序。
09. **channel** 消息通道，在客户端的每个连接里，可建立多个channel，每个channel代表一个会话任务。
## 消息队列的使用过程大概如下：
01. 客户端连接到消息队列服务器，打开一个channel。
02. 客户端声明一个exchange，并设置相关属性。
03. 客户端声明一个queue，并设置相关属性。
04. 客户端使用routing key，在exchange和queue之间建立好绑定关系。
05. 客户端投递消息到exchange。
exchange接收到消息后，就根据消息的key和已经设置的binding，进行消息路由，将消息投递到一个或多个队列里。
exchange也有几个类型，完全根据key进行投递的叫做Direct交换机，例如，绑定时设置了routing key为”abc”，那么客户端提交的消息，只有设置了key为”abc”的才会投递到队列。对key进行模式匹配后进行投递的叫做Topic交换机，符号”#”匹配一个或多个词，符号”*”匹配正好一个词。例如”abc.#”匹配”abc.def.ghi”，”abc.*”只匹配”abc.def”。还有一种不需要key的，叫做Fanout交换机，它采取广播模式，一个消息进来时，投递到与该交换机绑定的所有队列。
RabbitMQ支持消息的持久化，也就是数据写在磁盘上，为了数据安全考虑，我想大多数用户都会选择持久化。消息队列持久化包括3个部分：
　　（1）exchange持久化，在声明时指定durable => 1
　　（2）queue持久化，在声明时指定durable => 1
　　（3）消息持久化，在投递时指定delivery_mode => 2（1是非持久化）
如果exchange和queue都是持久化的，那么它们之间的binding也是持久化的。如果exchange和queue两者之间有一个持久化，一个非持久化，就不允许建立绑定。

## 附：rabbitmq的一些常用命令　　
01. rabbitmq的安装、启动和停止
02. rabbitmq-service.bat install 
03. rabbitmq-service.bat start 
04. rabbitmq-service.bat stop
05. 列出所有queue：rabbitmqctl list_queues
06. 列出指定queue的信息：rabbitmqctl list_queues [the queue name] messages_ready messages_unacknowledged
07. 列出所有exchange：rabbitmqctl list_exchanges
08. 列出所有binding：rabbitmqctl list_bindings
09. 安装基于web的管理插件：rabbitmq-plugins.bat enable rabbitmq_management 
10. 关闭节点：rabbitmqctl stop
11. 停止RabbitMQ应用：rabbitmqctl stop_app
12. 启动RabbitMQ应用：rabbitmqctl start_app
13. 显示RabbitMQ中间件各种信息：rabbitmqctl status
14. 重置RabbitMQ节点：rabbitmqctl reset # rabbitmqctl force_reset
从它属于的任何集群中移除，从管理数据库中移除所有数据，例如配置过的用户和虚拟宿主, 删除所有持久化的消息。
force_reset命令和reset的区别是无条件重置节点，不管当前管理数据库状态以及集群的配置。如果数据库或者集群配置发生错误才使用这个最后 的手段。
注意：只有在停止RabbitMQ应用后，reset和force_reset才能成功。
15. 循环日志文件：rabbitmqctl rotate_logs[suffix]
16. 集群管理：rabbitmqctl cluster clusternode…

## 用户管理
01. 添加用户：rabbitmqctl add_user username password
02. 删除用户：rabbitmqctl delete_user username
03. 修改密码：rabbitmqctl change_password username newpassword
04. 列出所有用户：rabbitmqctl list_users

## 权限控制
01. 创建虚拟主机：rabbitmqctl add_vhost vhostpath
02. 删除虚拟主机：rabbitmqctl delete_vhost vhostpath
03. 列出所有虚拟主机：rabbitmqctl list_vhosts
04. 设置用户权限：rabbitmqctl set_permissions [-p vhostpath] username regexp regexp regexp
05. 清除用户权限：rabbitmqctl clear_permissions [-p vhostpath] username
06. 列出虚拟主机上的所有权限：rabbitmqctl list_permissions [-p vhostpath]
07. 列出用户权限：rabbitmqctl list_user_permissions username
