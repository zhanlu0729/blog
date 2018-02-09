**URL Prefix** http://master-ip:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces
**Demo** http://192.168.204.10:8080/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces/dev/pods/openerp-quartz-3387384183-s4lwk/metrics/network/rx

## Heapster各项含义
1. **cpu/limit**	CPU hard limit in millicores.
1. **cpu/node_capacity**	一个节点的CPU容量.
1. **cpu/node_allocatable**	Cpu可分配的节点.
1. **cpu/node_reservation**	在可分配节点上保留的cpu份额.
1. **cpu/node_utilization**	CPU利用率作为节点可分配份额.
1. **cpu/request**	CPU request (the guaranteed amount of resources) in millicores.
1. **cpu/usage**	Cumulative CPU usage on all cores.
1. **cpu/usage_rate**	CPU usage on all cores in millicores.
1. **filesystem/usage**	Total number of bytes consumed on a filesystem.
1. **filesystem/limit**	The total size of filesystem in bytes.
1. **filesystem/available**	The number of available bytes remaining in a the filesystem
1. **filesystem/inodes**	The number of available inodes in a the filesystem
1. **filesystem/inodes_free**	The number of free inodes remaining in a the filesystem
1. **disk/io_read_bytes**	Number of bytes read from a disk partition
1. **disk/io_write_bytes**	Number of bytes written to a disk partition
1. **disk/io_read_bytes_rate**	Number of bytes read from a disk partition per second
1. **disk/io_write_bytes_rate**	Number of bytes written to a disk partition per second
1. **memory/limit**	Memory hard limit in bytes.
1. **memory/major_page_faults**	Number of major page faults.
1. **memory/major_page_faults_rate**	Number of major page faults per second.
1. **memory/node_capacity**	Memory capacity of a node.
1. **memory/node_allocatable**	Memory allocatable of a node.
1. **memory/node_reservation**	Share of memory that is reserved on the node allocatable.
1. **memory/node_utilization**	Memory utilization as a share of memory allocatable.
1. **memory/page_faults**	Number of page faults.
1. **memory/page_faults_rate**	Number of page faults per second.
1. **memory/request**	Memory request (the guaranteed amount of resources) in bytes.
1. **memory/usage**	Total memory usage.
1. **memory/cache**	Cache memory usage.
1. **memory/rss**	RSS memory usage.
1. **memory/working_set**	Total working set usage. Working set is the memory being used and not easily dropped by the kernel.
1. **accelerator/memory_total**	Memory capacity of an accelerator.
1. **accelerator/memory_used**	Memory used of an accelerator.
1. **accelerator/duty_cycle**	Duty cycle of an accelerator.
1. **network/rx**	Cumulative number of bytes received over the network.
1. **network/rx_errors**	Cumulative number of errors while receiving over the network.
1. **network/rx_errors_rate**	Number of errors while receiving over the network per second.
1. **network/rx_rate**	Number of bytes received over the network per second.
1. **network/tx**	Cumulative number of bytes sent over the network
1. **network/tx_errors**	Cumulative number of errors while sending over the network
1. **network/tx_errors_rate**	Number of errors while sending over the network
1. **network/tx_rate**	Number of bytes sent over the network per second.
1. **uptime**
