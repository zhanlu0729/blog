## Cluster
1. **所有项** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/metrics
- CPU
  - cpu/limit
  - cpu/request
  - cpu/usage_rate
- Memory
  - memory/limit
  - memory/request
  - memory/usage
 
## Node
1. **所有节点** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/nodes
2. **单个节点** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/nodes/vm-9f-k8s-node04/metrics
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
  
## Namespace
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
  
## Pod
1. **命名空间下的所有Pod** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces/{namespace-name}/pods
2. **单个Pod** http://masterIP:port/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/namespaces/{namespace-name}/pods/{pod-name}/metrics/
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
