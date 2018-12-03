## ZK使用场景
### leader选举
#### LeaderLatch
1. 构造函数：
```
public LeaderLatch(CuratorFramework client, String latchPath)
public LeaderLatch(CuratorFramework client, String latchPath,  String id)
```
1. ``public void leaderLatche.start()`` 启动``LeaderLatch``
2. ``public void leaderLatche.close()`` 关闭``LeaderLatch``
3. ``public boolean hasLeadership()`` 当前``LeaderLatch``是否为``Leader``，同一个``latchPath``路径下的``LeaderLatch``进行竞选``Leader``
4. ``public void addListener(LeaderLatchListener listener)`` 添加监听网络连接问题的监听器， 当``SUSPENDED``或``LOST``时, leader不再认为自己还是leader；当``LOST``连接重连后``RECONNECTED``,LeaderLatch会删除原有的ZNode节点，然后重新创建一个，LeaderLatch应该要考虑导致leader丢失的连接问题；强烈推荐你使用``ConnectionStateListener``
