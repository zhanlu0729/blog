###k8s常用命令
### kubectl run
1. 创建并运行一个或多个容器镜像; 创建一个deployment 或job 来管理容器.
2. 语法：`kubectl run NAME --image=image [--env="key=value"] [--port=port] [--replicas=replicas] [--dry-run=bool] [--overrides=inline-json] [--command] -- [COMMAND] [args...]`
3. 示例：
  - 启动nginx实例`kubectl run nginx --image=nginx`
  - 启动hazelcast实例，暴露容器端口 5701`kubectl run hazelcast --image=hazelcast --port=5701`
  - 启动hazelcast实例，在容器中设置环境变量"DNS_DOMAIN = cluster"和"POD_NAMESPACE = default"`kubectl run hazelcast --image=hazelcast --env="DNS_DOMAIN=cluster" --env="POD_NAMESPACE=default"`
  - 启动nginx实例，设置副本数5`kubectl run nginx --image=nginx --replicas=5`
  - 运行Dry打印相应的API对象而不创建它们`kubectl run nginx --image=nginx --dry-run`


## Node
01. **添加标签** kubectl label no/nodeName labelKey=labelValue
02. **删除标签** kubectl label no/nodeName labelKey-

## Deployment
01. **创建对象** kubectl create -f yamlFile
02. **删除对象** kubectl delete -f yamlFile | kubectl delete deploy/deployName

