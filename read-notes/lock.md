## 1. 硬件层面

### 1.1 CPU

#### 1.1.1 多核
- CPU cache
    - 多级
    - 缓存一致性（cache coherence）
- cache line
- 指令流水线

#### 1.1.2 原子指令
- CAS
    - 比较并交换
    - *compare-and-swap*
- 加载链接/存储条件
    - *load-linked*
    - *store-conditional*

### 1.2 内存

#### 1.2.3 内存屏障

## 2. 操作系统层面
## 3. JVM层面

### 3.1 JVM中的对象结构

#### 3.1.1 监控器（monitor）

#### 3.1.2 Mark Word

### 3.2 4层锁架构
1. 偏向锁
2. 自旋锁
3. 轻量级锁
4. 重量级锁

### 3.3 Happens-before
JMM规定了JVM内部动作的次序关系

#### 3.3.1 重排序
为了保障JMM提供的可见性，同步会抑制重排序优化

## 4. Java语言层面

### 4.1 synchronized

### 4.2 volatile

### 4.3 内部锁的局限
- 不能中断正在等待锁的线程
- 只能无限等待

## 5. 应用层面

### 5.1 显式锁（Explicit Locks）

Java 5
1. Lock
    - `java.util.concurrent.locks.Lock`
    - 所有加锁/解锁的方法都是**显式**的
    - 获取锁有多种方式
        - 无条件的
            - `void lock()` 
        - 可轮询的
            - `boolean tryLock()`
        - 定时的
            - `boolean tryLock(long time, TimeUnit unit) throws InterruptedException`
        - 可中断的
            - `void lockInterruptibly() throws InterruptedException`
    - **Lock 的实现必须提供具有与内部加锁（monitor）相同的内存可见性的语义**
    - **需要确保显式的释放锁**
        - `finally`
1. ReentrantLock
    - `java.util.concurrent.locks.ReentrantLock`
    - 标准的**互斥锁**
    - 并不是作为内部锁（monitor）的替代品，而是在内部锁（monitor）收到限制时，提供可选的高级特性
    - 实现了`java.util.concurrent.locks.Lock`接口
    - 提供了与`synchronized`相同的互斥和内存可见性保证
    - 进入/退出与`synchronized`相同的语义
    - 与`synchronized`一样的可重入加锁的语义
    - 优点
        - *Java 6 引入偏向锁，平均来说和内部锁的优势不再那么的大了，但在极端情况下仍然占有一定的优势* 
        - 竞争性能远高于内部锁
            - 可伸缩性能更好
            - 更少的系统调用
            - 更少的上下文切换
            - 更少的内存同步通信（共享的内存总线）
    - **公平性**
        - 非公平
            - 默认
            - 吞吐量好
            - 各线程表现差异大
            - 闯入锁
                - 让闯入者获得锁继续运行，比唤醒等待线程，再让等待线程开始工作要快的多
        - 公平
            - 伸缩性好
            - 因挂起/重新开始线程的代价带了巨大的性能开销
                - 为了维护等待线程的公平调度
    - 缺点
        - 在Java 5 中，线程转储无法体现
        - 难以被JIT优化
            - 锁省略
            - 粗化锁
3. 读写锁
    - `java.util.concurrent.locks.ReadWriteLock`
    - 读多写少的场景
    - 高并发时才具备优势
        - 内部复杂度高
        - 本身需要一定的开销
    - 使用时，应考虑几个方面：
        - 释放优先
            - 同等条件下读写锁之间的优先级
        - 读者闯入
            - 对于写等待的情况需要考虑
            - 需要考虑写线程饥饿问题
        - 重进入
        - 降级
            - 写降级为读
            - 并不允许其他写
        - 升级
            - 读升级为写
            - 优先级的问题
            - 容易导致死锁
                - 两个读同时升级写
                - 且不释放读
    - 实现：
        - `java.util.concurrent.locks.ReentrantReadWriteLock` 
            - 可重入
                - Java 5 中读锁使用了信号量
                    - 信号量为不可重入
                - Java 6 改写为队列
            - 写锁唯一
                - 写锁互斥
            - 公平
                - 可选
                - 选择权交给等待时间最长的线程
                - 写抢占读
            - 非公平
                - 默认
                - 允许降级
                - 不允许升级
    - 适用于：
        - 加锁时间较长
        - 读多写少
        - 读-写/写-写
            - 与互斥锁类似
        - 读-读
            - 性能优于互斥锁

### 5.2 状态

- 状态依赖（state-dependent）
- 使用状态作为**先验条件**
- 条件变量
- 内部条件队列

#### 5.2.1 条件队列

- 等待集
- 将等待某种条件（信号）的线程放入一个队列中

##### 5.2.1.1 Java内部条件队列

- Java 中，每个对象都可以当作条件队列
    - `wait`
    - `notify`
    - `notifyAll`
    - 和内部锁类似
- 操作之前需要持有对象内部锁（monitor）
    - 需要进入/移出条件队列
        - 所以需要持有内部锁
    - 需要对状态变量进行保护
    - 这样才能保障条件谓词的可靠
- 注意事项
    - 条件谓词的选择
    - 非公平
    - 信号错失
    - 伪唤醒
    - **等待转移**
    - 两难问题
        - `notify`不够安全
        - `notifyAll`性能随着条件队列中线程数量增多会急剧下降
- 一个单独地内部条件队列可以与多个条件谓词共同使用
    - 所以也就可能导致伪唤醒
    - 所以需要循环检查条件谓词

使用范式：
```
synchronized(lock){
    while ( !conditionPredicate() )
        lock.wait();
}
```

##### 5.2.1.2 显式Condition

- 更多的控制权
- 和内部条件队列一样，需要与锁（Lock）进行关联
    - 每个锁（Lock）可以有多个等待集
    - 可中断/不可中断的条件等待
    - 基于时限的等待以及公平/非公平队列
- 公平性
    - 条件队列的公平性取决于相关联锁（Lock）的公平性
- **API不同**
    - Condition也继承于Objec，所以也有`wait`，`notify`，`notifyAll`
    - 而Condition提供的特性都对应于`await`，`signal`，`signalAll`
    - 使用时需要注意
- 更好的可读性
    - 可以为每一个条件谓词分配一个Condition
    - 避免多个条件谓词共享同一个内部条件队列
    - 唤醒效率也相应提高

### 5.3 同步器（Synchronizer）

- `java.util.concurrent.locks.AbstractQueuedSynchronizer`
    - AQS
- 用来构建锁和Synchronizer的框架
    - **Java并发框架的基石**
    - 基于此框架的实现：
        - ReentrantLock
        - Semaphore
        - CountDownLatch
        - ReentrantReadWriteLock
        - SynchronousQueue
            - Java 6改进为非阻塞版本
        - FutureTask
            - Java 6
- AQS主要提供
    - 获取（acquire）
        - 可阻塞
    - 释放（release）
        - 不可阻塞
        - 允许在请求执行前阻塞
    - **管理一个关于状态信息的单一整数**
        - `state`
        - **受保护的状态信息**
        - 具体实现时，可以具有不同的含义
            - ReentrantLock中表示：请求了多少次锁
            - Semaphore中表示：剩余的许可数
            - FutureTask中表示：任务的状态（新建，运行，完成，取消）
    - **一个等待队列**
- AQS操作的基本范式：

```
boolean acquire() throws InterruptedException {
    
    while (state does not permit acquire) {
        if (blocking acquisition requested) {
            enqueue current thread if not already queued
            block current thread
        } else {
            return failure
        }
    }
    
    possibly update synchronization state
    dequeue thread if it was queued
    return success
    
}

void release() {
    update synchronization state
    if (new state mqy permit a blocked thread to acquire) {
        unblock one or more queued threads
    }
}
```

