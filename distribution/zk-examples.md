## Curator概述
1. ``curator-framework``：封装了对ZooKeeper常用API操作，如：对ZooKeeper链接的管理，对链接丢失自动重新链接
2. ``curator-client``：ZK客户端API封装，解决了一些繁琐低级的处理，如：重试策略等
3. ``curator-recipes``：封装了一些高级特性，如：Cache事件监听、选举、分布式锁、分布式计数器、分布式Barrier等
4. ``Extensions``：对curator-recipes的扩展实现，提供基于RESTful的Recipes WEB服务

### 创建客户端
1. 
```
RetryPolicy retryPolicy = new ExponentialBackoffRetry(1000, 3);
CuratorFramework client =
CuratorFrameworkFactory.newClient(
                        connectionInfo,
                        5000,
                        3000,
                        retryPolicy);
```

### leader选举
