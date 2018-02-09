## Nodes
1. **所有节点** http://192.168.204.10:8080/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/nodes
2. **单个节点** http://192.168.204.10:8080/api/v1/proxy/namespaces/kube-system/services/heapster/api/v1/model/nodes/vm-9f-k8s-node04/metrics 
- [
  - "memory/limit",
  - "memory/request",
  - "memory/node_utilization",
  - "memory/page_faults",
  - "memory/page_faults_rate",
  - "memory/node_capacity",
  - "memory/usage",
  - "memory/node_allocatable",
  - "memory/major_page_faults_rate",
  - "memory/working_set",
  - "memory/node_reservation",
  - "memory/major_page_faults",
  
  "cpu/limit"
  "cpu/request",
  "cpu/usage",
  "cpu/node_utilization",
  "cpu/node_allocatable",
  "cpu/usage_rate",
  "cpu/node_capacity",
  "cpu/node_reservation",
  
  "network/tx_errors_rate",
  "network/tx_rate",
  "network/rx",
  "network/rx_errors",
  "network/rx_rate",
  "network/tx_errors",
  "network/rx_errors_rate",
  "network/tx",
  "uptime",
 ]
