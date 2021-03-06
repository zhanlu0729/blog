## 度量(Metrics)
01. **cpu/limit**	CPU硬限制,以m为单位(CPU hard limit in millicores)
02. **cpu/request**	CPU请求（保证的资源量）以m为单位(CPU request (the guaranteed amount of resources) in millicores)
03. **cpu/usage**	所有内核上的累积CPU使用率(Cumulative CPU usage on all cores)
04. **cpu/usage_rate**	所有内核的CPU使用率均以m为单位(CPU usage on all cores in millicores)
05. **cpu/node_capacity**	节点的CPU容量(Cpu capacity of a node)
06. **cpu/node_allocatable**	节点的CPU可分配容量(Cpu allocatable of a node)
07. **cpu/node_reservation**	在可分配节点上保留的cpu份额(Share of cpu that is reserved on the node allocatable)
08. **cpu/node_utilization**	CPU利用率作为节点可分配份额(CPU utilization as a share of node allocatable)

09. **memory/limit**	内存硬限制以字节为单位(Memory hard limit in bytes)
10. **memory/request**	内存请求（保证的资源量）以字节为单位(Memory request (the guaranteed amount of resources) in bytes)
11. **memory/usage**	内存使用总量(Total memory usage)
12. **memory/node_capacity**	节点的内存容量(Memory capacity of a node)
13. **memory/node_allocatable**	节点的内存可分配容量(Memory allocatable of a node)
14. **memory/node_reservation**	在可分配节点上保留的内存份额(Share of memory that is reserved on the node allocatable)
15. **memory/node_utilization**	内存利用率作为可分配内存的一部分(Memory utilization as a share of memory allocatable)
16. **memory/page_faults**	页面错误的数量(Number of page faults)
17. **memory/page_faults_rate**	每秒页面错误次数(Number of page faults per second)
18. **memory/major_page_faults**	主要页面错误的数量(Number of major page faults)
19. **memory/major_page_faults_rate**	每秒主要页面错误次数(Number of major page faults per second)
20. **memory/cache**	缓存内存使用情况(Cache memory usage)
21. **memory/rss**	RSS内存使用情况(RSS memory usage)
22. **memory/working_set**	总工作集用法。工作集是正在使用的内存，不容易被内核丢弃(Total working set usage. Working set is the memory being used and not easily dropped by the kernel)
23. **accelerator/memory_total**	加速器的内存容量(Memory capacity of an accelerator)
24. **accelerator/memory_used**	内存用于加速器(Memory used of an accelerator)
25. **accelerator/duty_cycle**	加速器的占空比(Duty cycle of an accelerator)

26. **network/rx**	通过网络接收的累计字节数(Cumulative number of bytes received over the network).
27. **network/rx_errors**	通过网络接收时发生错误的累积次数(Cumulative number of errors while receiving over the network)
28. **network/rx_errors_rate**	每秒通过网络接收时的错误数(Number of errors while receiving over the network per second)
29. **network/rx_rate**	每秒通过网络接收的字节数(Number of bytes received over the network per second)
30. **network/tx**	通过网络发送的累计字节数(Cumulative number of bytes sent over the network)
31. **network/tx_errors**	通过网络发送时发生错误的累积次数(Cumulative number of errors while sending over the network)
32. **network/tx_errors_rate**	通过网络发送时的错误数(Number of errors while sending over the network)
33. **network/tx_rate**	每秒通过网络发送的字节数(Number of bytes sent over the network per second)

34. **filesystem/usage**	文件系统上消耗的字节总数(Total number of bytes consumed on a filesystem)
35. **filesystem/limit**	文件系统的总大小（以字节为单位）(The total size of filesystem in bytes)
36. **filesystem/available**	文件系统中剩余的可用字节数(The number of available bytes remaining in a the filesystem)
37. **filesystem/inodes**	文件系统中可用inode的数量(The number of available inodes in a the filesystem)
38. **filesystem/inodes_free**	文件系统中剩余的空闲inode数量(The number of free inodes remaining in a the filesystem)
39. **disk/io_read_bytes**	从磁盘分区读取的字节数(Number of bytes read from a disk partition)
40. **disk/io_write_bytes**	写入磁盘分区的字节数(Number of bytes written to a disk partition)
41. **disk/io_read_bytes_rate**	每秒从磁盘分区读取的字节数(Number of bytes read from a disk partition per second)
42. **disk/io_write_bytes_rate**	每秒写入磁盘分区的字节数(Number of bytes written to a disk partition per second)
43. **uptime** 自从容器启动以来的毫秒数

## 标签(Labels)
01. **pod_id**	Pod的唯一ID(Unique ID of a Pod)
02. **pod_name**	用户提供的Pod的名称(User-provided name of a Pod)
03. **container_base_image**	容器的基础映像(Base image for the container)
04. **container_name**	用户提供的容器名称或系统容器的完整cgroup名称(User-provided name of the container or full cgroup name for system containers)
05. **host_id**	Cloud-provider云提供商指定或用户指定节点的标识符(specified or user specified Identifier of a node)
06. **hostname**	容器运行的主机名(Hostname where the container ran)
07. **nodename**	容器运行的节点名称(Nodename where the container ran)
08. **labels**	用户提供的标签的逗号分隔（默认）列表。格式是“键：值”(Comma-separated(Default) list of user-provided labels. Format is 'key:value')
09. **namespace_id**	Pod的命名空间的UID(UID of the namespace of a Pod)
10. **namespace_name**	用户提供的名称空间名称(User-provided name of a Namespace)
11. **resource_id**	用于区分同一类型的多个指标的唯一标识符。ex文件系统/使用率下的Fs分区，磁盘/ io_read_bytes下的磁盘设备名称(A unique identifier used to differentiate multiple metrics of the same type. e.x. Fs partitions under filesystem/usage, disk device name under disk/io_read_bytes)
12. **make**	使加速器（NVIDIA，AMD，谷歌等）(Make of the accelerator (nvidia, amd, google etc.))
13. **model**	加速器型号（tesla-p100，tesla-k80等）(Model of the accelerator (tesla-p100, tesla-k80 etc.))
14. **accelerator_id**	加速器的ID(ID of the accelerator)

## Heapster(K8s Darshboard) Metrics
1. **所有节点** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard/api/v1/node
2. **单个节点** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard/api/v1/node/{node-name}

## Cluster-level Metrics
1. **整个集群** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/metrics
- CPU
  - cpu/limit
  - cpu/request
  - cpu/usage_rate
- Memory
  - memory/limit
  - memory/request
  - memory/usage
 
## Node-level Metrics
1. **所有节点** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/nodes
2. **单个节点** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/nodes/{node-name}/metrics
- CPU
  - cpu/limit
  - cpu/request
  - cpu/usage
  - cpu/usage_rate
  - cpu/node_utilization
  - cpu/node_allocatable
  - cpu/node_capacity
  - cpu/node_reservation
- Memory
  - memory/limit
  - memory/request
  - memory/usage
  - memory/node_utilization
  - memory/node_capacity
  - memory/node_reservation
  - memory/node_allocatable
  - memory/page_faults
  - memory/page_faults_rate
  - memory/major_page_faults_rate
  - memory/major_page_faults
  - memory/working_set
- Network
  - network/tx
  - network/tx_rate
  - network/tx_errors
  - network/tx_errors_rate
  - network/rx
  - network/rx_rate
  - network/rx_errors
  - network/rx_errors_rate
- OS
  - uptime
- DiskAndFileSystem
  - http://nodeIP:4194/api/v1.1/subcontainers/
  
## Namespace-level Metrics
1. **所有命名空间** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces
2. **单个命名空间** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces/{namespace-name}/metrics
- CPU
  - cpu/limit
  - cpu/request
  - cpu/usage_rate
- Memory
  - memory/limit
  - memory/request
  - memory/usage
  
## Pod-level Metrics
1. **命名空间下的所有Pod** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces/{namespace-name}/pods
2. **单个Pod** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces/{namespace-name}/pods/{pod-name}/metrics
- CPU
  - cpu/limit
  - cpu/request
  - cpu/usage
  - cpu/usage_rate
- Memory
  - memory/limit
  - memory/request
  - memory/usage
  - memory/page_faults
  - memory/page_faults_rate
  - memory/major_page_faults_rate
  - memory/major_page_faults
  - memory/working_set
- Network
  - network/tx
  - network/tx_rate
  - network/tx_errors
  - network/tx_errors_rate
  - network/rx
  - network/rx_rate
  - network/rx_errors
  - network/rx_errors_rate
- OS
  - uptime

## Container-level Metrics
1. **Pod下的所有容器** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces/{namespace-name}/pods/{pod-name}/containers
2. **单个容器** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces/{namespace-name}/pods/{pod-name}/{container-name}/metrics
- CPU
  - cpu/limit
  - cpu/request
- Memory
  - memory/limit
  - memory/request
