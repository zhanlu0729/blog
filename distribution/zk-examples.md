## Curator概述
1. ``curator-framework``：封装了对ZooKeeper常用API操作，如：对ZooKeeper链接的管理，对链接丢失自动重新链接
2. ``curator-client``：ZK客户端API封装，解决了一些繁琐低级的处理，如：重试策略等
3. ``curator-recipes``：封装了一些高级特性，如：Cache事件监听、选举、分布式锁、分布式计数器、分布式Barrier等
4. ``Extensions``：对curator-recipes的扩展实现，提供基于RESTful的Recipes WEB服务

### 创建客户端
| 参数名     |     说明     |
| --------- | ------------ |
| connectionString    | 服务器列表，格式host1:port1,host2:port2,... |
| retryPolicy         | 重试策略,内建有四种重试策略,也可以自行实现RetryPolicy接口 |
| sessionTimeoutMs    | 会话超时时间，单位毫秒，默认60000ms  |
| connectionTimeoutMs | 连接创建超时时间，单位毫秒，默认60000ms  |
2. 使用静态工厂方法创建客户端
```
RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 3);
CuratorFramework client = CuratorFrameworkFactory.newClient(connectionString, 5000, 3000, retryPolicy);
```
2. 使用链式编程(Fluent风格)的Api创建客户端
```
RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 3);
        CuratorFramework client =
        CuratorFrameworkFactory.builder()
                .connectString(connectionString)
                .sessionTimeoutMs(5000)
                .connectionTimeoutMs(5000)
                .retryPolicy(retryPolicy)
                .build();
```
3. 创建包含隔离命名空间(隔离业务)的会话
```
RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 3);
        CuratorFramework client =
        CuratorFrameworkFactory.builder()
                .connectString(connectionInfo)
                .sessionTimeoutMs(5000)
                .connectionTimeoutMs(5000)
                .retryPolicy(retryPolicy)
                .namespace("namespace-name")
                .build();
```

### leader选举
