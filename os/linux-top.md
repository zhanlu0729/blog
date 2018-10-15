### TOP 命令详解
1. top -p processID 查看进程的资源消耗情况
2. top -H -p processID 查看进程下所有线程的资源消耗情况

top 统计信息前五行是系统整体的统计信息

1、第一行是任务队列信息 同uptime质性命令结果一样。

1
06:47:11 up  6:39,  3 users,  load average: 0.00, 0.01, 0.05
1
06:47:11
当前时间               
1
up  6:39
系统运行时间，格式为时：分
1
3 users
当前用户登录数
1
load average: 0.00, 0.01, 0.05
系统负载，即任务队列的平均长度，三个数值分别为1分钟，5分钟，15分钟前到

现在的平均值。

一般来说，每个 CPU 内核当前活跃进程数不大于 3 ，则系统运行表现良好！也就是说主机是四核cpu的话，那么只要 uptime 最后输出的遗传数字数值小于 4*3=12 即表示系统负载不是很严重。

 

2、第二行、三行为进程和 CPU 的信息。当有多个 CPU 时，内容可能超过两行。

Tasks: 367 total,   2 running, 365 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.3 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
asks: 367 total
进程总数
2 running
正在运行的进程数
365 sleeping
睡眠的进程数
0 stopped
停止的进程数
0 zombie                          
僵尸进程数                                                                                                            

%Cpu(s):  0.0 us
 系统用户进程使用 CPU 百分比。不包括调高优先级的进程。 CPU%是由每个核的 CPU 占用率之和算出来的。如果你是 4 核 CPU，核 1，CPU 使用率为100%，核 2，CPU 使用率为100%，则会CPU 高于100%的现象，最终为200%。
 
0.3 sy
 内核中的进程占用 CPU 百分比。
 
0.0 ni
 用户进程空间内改变过优先级的进程占用 CPU 百分比。
 
99.7 id
 空闲 CPU 百分比。
 

4、第四行行为内存信息。

KiB Mem :  1001332 total,   340616 free,   171456 used,   489260 buff/cache
KiB Swap:  2097148 total,  2097036 free,      112 used.   630508 avail Mem
Mem :  1001332 total
物理内存总量
171456 used
使用的物理内存总量
340616 free
空闲物理内存
489260 buff/cache
用作内核缓存的内存量
和free -k 一个意思
Swap:  2097148 total
减缓区总量
12 used
使用交换空间呢总量
2097036 free
 可用交换空间                                
 	 
 

二、进程信息

  PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
   138 root      20   0       0      0      0 R  0.3  0.0   0:00.83 rcuos/0
PID
进程id
USER
进程所有者的用户名
NI
进程优先级。nce值。负值表示高优先级，正值表示低优先者。
RES
实际使用内存大小
S
进程状态
D  不可中断的睡眠状态
R 运行
S 睡眠
T 跟踪/停止
Z 僵尸进程
%CPU
上次更新到现在的 CPU 时间占用百分比 
%MEM
 进程使用的物理内存百分比
TIME+
进程使用CPU时间总计，单位  1/100s 
COMMAND
 命令名/命令行
top 快捷键：

q  退出

M 按内存排序

P 按CPU 排序

<>  翻页

 

控制（关闭）进程：

kill   给进程发送信号（停止进程）

常用信号：

1   HUP   重新加载配置文件。类似重启。

2  INT     和ctrl + c 一样　　一般用于通知前台进程终止进程

9  KILL    强行终端

19  stop   和 ctrl+z 一样

 

pkill = killall

 

优先级控制：

nice值  -20~19   越小优先级越高  普通用户0-19

作用：以什么优先级运行进程。默认0

语法：nice  -n  优先级数字

[root@vmware ~]# nice -n 5 vim a.txt
top -p 11755

 

renice 修改正在运行的进程的优先级

#renice -n 5 PID  # 修改进程优先级

 

free  查看系统内存量

[root@vmware ~]# free
              total        used        free      shared  buff/cache   available
Mem:        1001332      173436      338476        7144      489420      628508
Swap:       2097148         112     2097036
buffers  缓存从磁盘读出的内容

cached  缓存需要写入磁盘的内容

 

[root@vmware ~]# dd if=/dev/zero of=a.txt bs=10M count=10
记录了10+0 的读入
记录了10+0 的写出
104857600字节(105 MB)已复制，0.880418 秒，119 MB/秒
然后在另一终端查看cache的增加速度

[root@vmware ~]# free
              total        used        free      shared  buff/cache   available
Mem:        1001332      170800      235780        7144      594752      629724
Swap:       2097148         112     2097036
 
