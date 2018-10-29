
#Jedis配置
1. redis.pool.maxTotal=1000 #最大活动对象数
2. redis.pool.maxIdle=100 #最大能够保持idel状态的对象数
3. redis.pool.minIdle=50 #最小能够保持idel状态的对象数
4. redis.pool.maxWaitMillis=10000  #当池内没有返回对象时，最大等待时间
5. redis.pool.testOnBorrow=true #当调用borrow Object方法时，是否进行有效性检查
6. redis.pool.testOnReturn=true #当调用return Object方法时，是否进行有效性检查
7. redis.pool.timeBetweenEvictionRunsMillis=30000 #“空闲链接”检测线程，检测的周期，毫秒数。如果为负值，表示不运行“检测线程”。默认为-1 
8. redis.pool.testWhileIdle=true #向调用者输出“链接”对象时，是否检测它的空闲超时
9. redis.pool.numTestsPerEvictionRun=50 #对于“空闲链接”检测线程而言，每次检测的链接资源的个数。默认为3
10. MinEvictableIdleTimeMillis=60000 #表示一个对象至少停留在idle状态的最短时间，然后才能被idle object evitor扫描并驱逐；这一项只有在timeBetweenEvictionRunsMillis大于0时才有意义   
11. redis.ip=xxxxxx #redis服务器的IP
12. redis1.port=6379 #redis服务器的Port
