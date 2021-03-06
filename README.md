## 事物的本质
1. **Docker容器的本质** -> 进程
2. **Pod的本质** -> 容器
3. **编写线程安全代码的本质** -> 管理对状态的访问
4. **简单的本质** 不是看上去更容易理解,也不是更容易使用；而是再无多余的部分可以丢弃,更无遗漏的部分可以添加进来了！**多乎哉？不多也！少乎哉？不少也！**
5. **区块链的本质** -> 一种特殊的分布式数据库
6. **架构的本质** -> 对系统进行常态的有序化演进，持续积极的面对不确定性和响应变化,有所取舍,并最终保证业务有序的发展
7. **互联网的本质** 不是连接而是共享。就像区块链的本质不是分布式账本，而是协作
8. **负载均衡的本质** 将请求或者说流量以期望的规则分摊到多个操作单元上进行执行
9. **数据传输的本质** 就是按照晶振震动周期或者整数倍来传输代表0/1的高低电平
10. **代码注释的本质** ``命名``的纠正、完善和补充，更多的是为了诉说``命名``未尽之意
11. **架构** 亦可取道围棋：围棋有走轻、走重之分，轻薄为妙，无进退为难之弊
12. **架构的最终产出** 应该是架构师思考及秩序化事物的一系列图形化展现，非表格，更非文字
13. **同步与异步、阻塞与非阻塞** 
```
a.阻塞与非阻塞是站在调用方的角度来看待问题的;阻塞与非阻塞是进程自己内部的问题
b.同步与异步是站在被调用方的角度来看待问题的;同步与异步是对于进程之间的通信方式来说的
c.阻塞与非阻塞：调用方在发起一个请求时，在没有得到被调用方响应结果的情况下，还能否继续做别的事；不能即为阻塞，能即为非阻塞
d.同步与异步：被调用方处理完结果，是自己将处理结果回调给调用方还是由调用方轮询得到；由调用方轮询得到即为同步，由被调用方回调给调用方即为异步
e.同步阻塞：调用方发起请求给被调用方，在线忙等响应结果，结果返回前不做任何事
f.同步非阻塞：调用方发起请求给被调用方，轮询获取响应结果，在每次轮询未果的情况可以做别的事
g.异步阻塞：
h.异步非阻塞：
```
