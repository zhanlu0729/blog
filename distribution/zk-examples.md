## ZK使用场景
### leader选举
#### Leader latch
1. 构造函数：
```
public LeaderLatch(CuratorFramework client, String latchPath)
public LeaderLatch(CuratorFramework client, String latchPath,  String id)
```
