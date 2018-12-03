## ZK使用场景
### leader选举
#### Leader latch
1. 构造函数：
```
public LeaderLatch(CuratorFramework client, String latchPath)
public LeaderLatch(CuratorFramework client, String latchPath,  String id)
```
1. ``public void leaderLatche.start()`` 启动``LeaderLatch``
2. ``public void leaderLatche.close()`` 关闭``LeaderLatch``
3. ``public boolean hasLeadership()`` 当前``LeaderLatch``是否为``Leader``，同一个latchPath路径下的``LeaderLatch``进行竞选``Leader``
4. ``public void addListener(LeaderLatchListener listener)`` 添加监听网络连接问题的监听器， 当SUSPENDED或LOST时, leader不再认为自己还是leader.当LOST连接重连后RECONNECTED,LeaderLatch会删除先前的ZNode然后重新创建一个.LeaderLatch应该要考虑导致leadershi丢失的连接问题
