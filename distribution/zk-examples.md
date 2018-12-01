## Curator概述
1. ``curator-framework``：封装了对ZooKeeper常用API操作，如：对ZooKeeper链接的管理，对链接丢失自动重新链接
2. ``curator-client``：ZK客户端API封装，解决了一些繁琐低级的处理，如：重试策略等
3. ``curator-recipes``：封装了一些高级特性，如：Cache事件监听、选举、分布式锁、分布式计数器、分布式Barrier等
4. ``Extensions``：对curator-recipes的扩展实现，提供基于RESTful的Recipes WEB服务

### 创建客户端
#### 1 参数说明
| 参数名     |     说明     |
| --------- | ------------ |
| connectionString    | 服务器列表，格式host1:port1, host2:port2, ... |
| retryPolicy         | 重试策略,内建有四种重试策略,也可以自行实现RetryPolicy接口 |
| sessionTimeoutMs    | 会话超时时间，单位毫秒，默认60000ms  |
| connectionTimeoutMs | 连接创建超时时间，单位毫秒，默认60000ms  |

| 节点类型     |     说明     |
| --------- | ------------ |
| PERSISTENT            | 持久化 |
| PERSISTENT_SEQUENTIAL | 持久化并且带序列号 |
| EPHEMERAL             | 临时   |
| EPHEMERAL_SEQUENTIAL  | 临时并且带序列号  |

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
2. ``client.create().forPath(path, "init".getBytes())`` 创建附带内容的节点
3. 
```
client.create().withMode(CreateMode.EPHEMERAL| EPHEMERAL_SEQUENTIAL| PERSISTENT|
        PERSISTENT_SEQUENTIAL).forPath(path)
``` 
创建一个指定创建模式的临时节点
4. ``client.create().creatingParentContainersIfNeeded().forPath(path)`` 创建一个能自动递归创建父节点的节点
5. ``client.delete().forPath(path)`` 删除一个节点
6. ``client.getData().forPath(path)`` 读取一个节点的数据内容
7. ``Stat stat = new Stat(); client.getData().storingStatIn(stat).forPath(path)`` 读取一个节点的数据内容及该节点的stat
6. ``guaranteed()`` 是一个保障接口，只要客户端会话有效，那么Curator会在后台持续进行删除操作，直到删除节点成功
6. ``client.delete().deletingChildrenIfNeeded().forPath(path)`` 删除一个节点并且递归删除其所有的子节点
7. ``client.delete().withVersion(10086).forPath(path)`` 强制指定版本进行节点删除节点
8. ``client.delete().guaranteed().forPath(path)`` 强制保证删除节点


### leader选举
