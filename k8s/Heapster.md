## URL Doc
1. **URL Prefix** http://master-ip:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces
2. **Demo** http://192.168.204.10:8080/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces/dev/pods/openerp-quartz-3387384183-s4lwk/metrics/network/rx

## Heapster各项含义
01. **cpu/limit**	CPU硬限制,以m为单位.
02. **cpu/node_capacity**	一个节点的CPU容量.
03. **cpu/node_allocatable**	Cpu可分配的节点.
04. **cpu/node_reservation**	在可分配节点上保留的cpu份额.
05. **cpu/node_utilization**	CPU利用率作为节点可分配份额.
06. **cpu/request**	CPU请求（保证的资源量）以m为单位.
07. **cpu/usage**	所有内核上的累积CPU使用率(Cumulative CPU usage on all cores)
08. **cpu/usage_rate**	所有内核的CPU使用率均以毫秒为单位(CPU usage on all cores in millicores)
09. **filesystem/usage**	文件系统上消耗的字节总数(Total number of bytes consumed on a filesystem)
10. **filesystem/limit**	文件系统的总大小（以字节为单位）(The total size of filesystem in bytes)
11. **filesystem/available**	文件系统中剩余的可用字节数(The number of available bytes remaining in a the filesystem)
12. **filesystem/inodes**	文件系统中可用inode的数量(The number of available inodes in a the filesystem)
13. **filesystem/inodes_free**	文件系统中剩余的空闲inode数量(The number of free inodes remaining in a the filesystem)
14. **disk/io_read_bytes**	从磁盘分区读取的字节数(Number of bytes read from a disk partition)
15. **disk/io_write_bytes**	写入磁盘分区的字节数(Number of bytes written to a disk partition)
16. **disk/io_read_bytes_rate**	每秒从磁盘分区读取的字节数(Number of bytes read from a disk partition per second)
17. **disk/io_write_bytes_rate**	每秒写入磁盘分区的字节数(Number of bytes written to a disk partition per second)
18. **memory/limit**	内存硬限制以字节为单位(Memory hard limit in bytes)
19. **memory/major_page_faults**	主要页面错误的数量(Number of major page faults)
20. **memory/major_page_faults_rate**	每秒主要页面错误次数(Number of major page faults per second)
21. **memory/node_capacity**	节点的内存容量(Memory capacity of a node)
22. **memory/node_allocatable**	内存可分配的节点(Memory allocatable of a node)
23. **memory/node_reservation**	在可分配节点上保留的内存份额(Share of memory that is reserved on the node allocatable)
24. **memory/node_utilization**	内存利用率作为可分配内存的一部分(Memory utilization as a share of memory allocatable)
25. **memory/page_faults**	页面错误的数量(Number of page faults)
26. **memory/page_faults_rate**	每秒页面错误次数(Number of page faults per second)
27. **memory/request**	内存请求（保证的资源量）以字节为单位(Memory request (the guaranteed amount of resources) in bytes)
28. **memory/usage**	内存使用总量(Total memory usage)
29. **memory/cache**	缓存内存使用情况(Cache memory usage)
30. **memory/rss**	RSS内存使用情况(RSS memory usage)
31. **memory/working_set**	总工作集用法。工作集是正在使用的内存，不容易被内核丢弃(Total working set usage. Working set is the memory being used and not easily dropped by the kernel)
32. **accelerator/memory_total**	加速器的内存容量(Memory capacity of an accelerator)
33. **accelerator/memory_used**	内存用于加速器(Memory used of an accelerator)
34. **accelerator/duty_cycle**	加速器的占空比(Duty cycle of an accelerator)
35. **network/rx**	通过网络接收的累计字节数(Cumulative number of bytes received over the network).
36. **network/rx_errors**	通过网络接收时发生错误的累积次数(Cumulative number of errors while receiving over the network)
37. **network/rx_errors_rate**	每秒通过网络接收时的错误数(Number of errors while receiving over the network per second)
38. **network/rx_rate**	每秒通过网络接收的字节数(Number of bytes received over the network per second)
39. **network/tx**	通过网络发送的累计字节数(Cumulative number of bytes sent over the network)
40. **network/tx_errors**	通过网络发送时发生错误的累积次数(Cumulative number of errors while sending over the network)
41. **network/tx_errors_rate**	通过网络发送时的错误数(Number of errors while sending over the network)
42. **network/tx_rate**	每秒通过网络发送的字节数(Number of bytes sent over the network per second)
43. **uptime** 自从容器启动以来的毫秒数
