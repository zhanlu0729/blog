## JVM参数详解
1. `-Xmx{number}m/g` 设置JVM最大可用内存
1. `-Xms{number}m/g` 设置JVM最小可用内存,此值可以设置与-Xmx相同,以避免每次垃圾回收完成后JVM重新分配内存
1. `-XX:-UseBiasedLocking` 关闭偏向锁（默认打开）
1. `-XX:+UseHeavyMonitors` 设置重量级锁
