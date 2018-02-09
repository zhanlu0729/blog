## Cluster
1. **所有项** http://192.168.204.10:8080/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/metrics
  - "cpu/limit"
  - "cpu/request"
  - "cpu/usage_rate"
  - "memory/limit"
  - "memory/request"
  - "memory/usage"
 
## Node
1. **所有节点** http://192.168.204.10:8080/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/nodes
2. **单个节点** http://192.168.204.10:8080/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/nodes/vm-9f-k8s-node04/metrics
  - "cpu/limit"
  - "cpu/request"
  - "cpu/usage"
  - "cpu/usage_rate"
  - "cpu/node_utilization"
  - "cpu/node_allocatable"
  - "cpu/node_capacity"
  - "cpu/node_reservation"
  
  - "memory/limit"
  - "memory/request"
  - "memory/usage"
  - "memory/node_utilization"
  - "memory/node_capacity"
  - "memory/node_reservation"
  - "memory/node_allocatable"
  - "memory/page_faults"
  - "memory/page_faults_rate"
  - "memory/major_page_faults_rate"
  - "memory/major_page_faults"
  - "memory/working_set"
  
  - "network/tx"
  - "network/tx_rate"
  - "network/tx_errors"
  - "network/tx_errors_rate"
  
  - "network/rx"
  - "network/rx_rate"
  - "network/rx_errors"
  - "network/rx_errors_rate"
  - "uptime"
