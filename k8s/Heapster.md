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
08. **cpu/usage_rate**	(CPU usage on all cores in millicores)
09. **filesystem/usage**	(Total number of bytes consumed on a filesystem)
10. **filesystem/limit**	(The total size of filesystem in bytes)
11. **filesystem/available**	(The number of available bytes remaining in a the filesystem)
12. **filesystem/inodes**	(The number of available inodes in a the filesystem)
13. **filesystem/inodes_free**	(The number of free inodes remaining in a the filesystem)
14. **disk/io_read_bytes**	(Number of bytes read from a disk partition)
15. **disk/io_write_bytes**	(Number of bytes written to a disk partition)
16. **disk/io_read_bytes_rate**	(Number of bytes read from a disk partition per second)
17. **disk/io_write_bytes_rate**	(Number of bytes written to a disk partition per second)
18. **memory/limit**	(Memory hard limit in bytes)
19. **memory/major_page_faults**	(Number of major page faults)
20. **memory/major_page_faults_rate**	(Number of major page faults per second)
21. **memory/node_capacity**	(Memory capacity of a node)
22. **memory/node_allocatable**	(Memory allocatable of a node)
23. **memory/node_reservation**	(Share of memory that is reserved on the node allocatable)
24. **memory/node_utilization**	(Memory utilization as a share of memory allocatable)
25. **memory/page_faults**	(Number of page faults)
26. **memory/page_faults_rate**	(Number of page faults per second)
27. **memory/request**	(Memory request (the guaranteed amount of resources) in bytes)
28. **memory/usage**	(Total memory usage)
29. **memory/cache**	(Cache memory usage)
30. **memory/rss**	(RSS memory usage)
31. **memory/working_set**	(Total working set usage. Working set is the memory being used and not easily dropped by the kernel)
32. **accelerator/memory_total**	(Memory capacity of an accelerator)
33. **accelerator/memory_used**	(Memory used of an accelerator)
34. **accelerator/duty_cycle**	(Duty cycle of an accelerator)
35. **network/rx**	(Cumulative number of bytes received over the network).
36. **network/rx_errors**	(Cumulative number of errors while receiving over the network)
37. **network/rx_errors_rate**	(Number of errors while receiving over the network per second)
38. **network/rx_rate**	(Number of bytes received over the network per second)
39. **network/tx**	(Cumulative number of bytes sent over the network)
40. **network/tx_errors**	(Cumulative number of errors while sending over the network)
41. **network/tx_errors_rate**	(Number of errors while sending over the network)
42. **network/tx_rate**	(Number of bytes sent over the network per second)
43. **uptime**
