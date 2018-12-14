## Curator概述
1. ``curator-framework``：封装了对ZooKeeper常用API操作，如：对ZooKeeper链接的管理，对链接丢失自动重新链接
2. ``curator-client``：ZK客户端API封装，解决了一些繁琐低级的处理，如：重试策略等
3. ``curator-recipes``：封装了一些高级特性，如：Cache事件监听、选举、分布式锁、分布式计数器、分布式Barrier等
4. ``Extensions``：对curator-recipes的扩展实现，提供基于RESTful的Recipes WEB服务

### 创建客户端
#### 1 参数说明
| 参数名     |     说明     |
| ---------  | ------------ |
| connectionString    | 服务器列表，格式host1:port1, host2:port2, ... |
| retryPolicy         | 重试策略,内建有四种重试策略,也可以自行实现RetryPolicy接口 |
| sessionTimeoutMs    | 会话超时时间，单位毫秒，默认60000ms  |
| connectionTimeoutMs | 连接创建超时时间，单位毫秒，默认60000ms  |

| 节点类型     |     说明     |
| ---------   | ------------ |
| PERSISTENT            | 持久化 |
| PERSISTENT_SEQUENTIAL | 持久化并且带序列号 |
| EPHEMERAL             | 临时   |
| EPHEMERAL_SEQUENTIAL  | 临时并且带序列号  |

| 节点状态     |     说明     |
| ---------   | ------------ |
| cZxid       | 节点被创建时候的事务ID |
| mZxid       | 节点最后一次被修改时候的事务ID |
| pZxid       | 该节点的子节点最后一次被修改时的事务ID。子节点删除或添加才会影响pZxid|
| ctime       | 节点被创建的时间  |
| mtime       | 节点被修改的世界 |
| dataVersion | 这个节点数据改变的次数 |
| cversion    | 子节点被改变的次数   |
| aclVersion  | 节点的ACL(访问控制列表被改变的次数)  |
| ephemeralOwner | 创建该临时节点的 session ID。如果是持久节点，设置为0 |
| dataLength     | 数据内容长度 |
| numChildren    | 当前节点子节点的个数   |

| 事件类型(CuratorEventType)     |     对应CuratorFramework实例的方法     |
| ---------     | ------------ |
| CREATE        | #create()    |
| DELETE        | #delete()    |
| EXISTS        | #checkExists()    |
| GET_DATA      | #getData()    |
| SET_DATA      | #setData()    |
| CHILDREN      | #getChildren()    |
| SYNC          | #sync(String,Object)  |
| GET_ACL       | #getACL()    |
| SET_ACL       | #setACL()    |
| WATCHED       | #Watcher(Watcher)    |
| CLOSING       | #close()    |

| 响应码(#getResultCode())     |     说明     |
| ---------   | ------------ |
| 0           | OK，即调用成功 |
| -4          | ConnectionLoss，即客户端与服务端断开连接 |
| -110        | NodeExists，即节点已经存在   |
| -112        | SessionExpired，即会话过期  |

#### 2. 使用静态工厂方法创建客户端
```
RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 3);
CuratorFramework client = CuratorFrameworkFactory.newClient(connectionString, 5000, 3000, retryPolicy);
```
#### 3. 使用链式编程(Fluent风格)的接口创建客户端
```
RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 3);
CuratorFramework client = CuratorFrameworkFactory.builder()
        .connectString(connectionString)
        .sessionTimeoutMs(5000)
        .connectionTimeoutMs(5000)
        .retryPolicy(retryPolicy)
        .build();
```
#### 4. 创建包含隔离命名空间(隔离业务)的客户端
```
RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 3);
CuratorFramework client = CuratorFrameworkFactory.builder()
        .connectString(connectionString)
        .sessionTimeoutMs(5000)
        .connectionTimeoutMs(5000)
        .retryPolicy(retryPolicy)
        .namespace(namespace-name)
        .build();
```
#### 5. 客户端管理
1. ``client.start()`` 启动客户端
2. ``client.close()`` 关闭客户端
#### 6. 节点维护
1. ``client.create().forPath(path)`` 创建一个内容为空的节点
2. ``client.create().forPath(path, bytes)`` 创建附带内容的节点
3. 创建一个指定创建模式的临时节点
```
client.create().withMode(CreateMode.EPHEMERAL| EPHEMERAL_SEQUENTIAL| PERSISTENT|
        PERSISTENT_SEQUENTIAL).forPath(path)
``` 
4. ``client.create().creatingParentContainersIfNeeded().forPath(path)`` 创建一个能自动递归创建父节点的节点
5. ``client.checkExists().forPath(path)`` 检查节点是否存在
6. ``client.getData().forPath(path)`` 读取一个节点的数据内容
7. ``client.getChildren().forPath(path)`` 获取节点的所有子节点路径
8. ``Stat stat = new Stat();client.getData().storingStatIn(stat).forPath(path)`` 读取一个节点的数据内容及该节点的stat
9. ``client.setData().forPath(path, bytes)`` 更新一个节点的数据内容
10. ``client.setData().withVersion(1).forPath(path, bytes)`` 强制指定版本更新一个节点的数据内容
11. ``guaranteed()`` 是一个保障接口，只要客户端会话有效，那么Curator会在后台持续进行删除操作，直到删除节点成功
12. ``client.delete().forPath(path)`` 删除一个节点
13. ``client.delete().deletingChildrenIfNeeded().forPath(path)`` 删除一个节点并且递归删除其所有的子节点
14. ``client.delete().withVersion(1).forPath(path)`` 强制指定版本进行节点删除一个节点
15. ``client.delete().guaranteed().forPath(path)`` 强制保证删除节点
