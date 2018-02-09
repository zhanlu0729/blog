**URL Prefix** http://master-ip:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces
**Demo**http://192.168.204.10:8080/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces/dev/pods/openerp-quartz-3387384183-s4lwk/metrics/network/rx

**cpu/limit**	CPU hard limit in millicores.
**cpu/node_capacity**	Cpu capacity of a node.
**cpu/node_allocatable**	Cpu allocatable of a node.
**cpu/node_reservation**	Share of cpu that is reserved on the node allocatable.
**cpu/node_utilization**	CPU utilization as a share of node allocatable.
**cpu/request**	CPU request (the guaranteed amount of resources) in millicores.
**cpu/usage**	Cumulative CPU usage on all cores.
**cpu/usage_rate**	CPU usage on all cores in millicores.
**filesystem/usage**	Total number of bytes consumed on a filesystem.
**filesystem/limit**	The total size of filesystem in bytes.
**filesystem/available**	The number of available bytes remaining in a the filesystem
**filesystem/inodes**	The number of available inodes in a the filesystem
**filesystem/inodes_free**	The number of free inodes remaining in a the filesystem
**disk/io_read_bytes**	Number of bytes read from a disk partition
**disk/io_write_bytes**	Number of bytes written to a disk partition
**disk/io_read_bytes_rate**	Number of bytes read from a disk partition per second
**disk/io_write_bytes_rate**	Number of bytes written to a disk partition per second
**memory/limit**	Memory hard limit in bytes.
**memory/major_page_faults**	Number of major page faults.
**memory/major_page_faults_rate**	Number of major page faults per second.
**memory/node_capacity**	Memory capacity of a node.
**memory/node_allocatable**	Memory allocatable of a node.
**memory/node_reservation**	Share of memory that is reserved on the node allocatable.
**memory/node_utilization**	Memory utilization as a share of memory allocatable.
**memory/page_faults**	Number of page faults.
**memory/page_faults_rate**	Number of page faults per second.
**memory/request**	Memory request (the guaranteed amount of resources) in bytes.
**memory/usage**	Total memory usage.
**memory/cache**	Cache memory usage.
**memory/rss**	RSS memory usage.
**memory/working_set**	Total working set usage. Working set is the memory being used and not easily dropped by the kernel.
**accelerator/memory_total**	Memory capacity of an accelerator.
**accelerator/memory_used**	Memory used of an accelerator.
**accelerator/duty_cycle**	Duty cycle of an accelerator.
**network/rx**	Cumulative number of bytes received over the network.
**network/rx_errors**	Cumulative number of errors while receiving over the network.
**network/rx_errors_rate**	Number of errors while receiving over the network per second.
**network/rx_rate**	Number of bytes received over the network per second.
**network/tx**	Cumulative number of bytes sent over the network
**network/tx_errors**	Cumulative number of errors while sending over the network
**network/tx_errors_rate**	Number of errors while sending over the network
**network/tx_rate**	Number of bytes sent over the network per second.
**uptime**
