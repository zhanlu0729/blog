###k8s常用命令
### kubectl run
1. 创建并运行一个或多个容器镜像; 创建一个deployment 或job 来管理容器.
2. **语法** `kubectl run NAME --image=image [--env="key=value"] [--port=port] [--replicas=replicas] [--dry-run=bool] [--overrides=inline-json] [--command] -- [COMMAND] [args...]`
3. **示例**
  - 启动nginx实例`kubectl run nginx --image=nginx`
  - 启动hazelcast实例，暴露容器端口 5701`kubectl run hazelcast --image=hazelcast --port=5701`
  - 启动hazelcast实例，在容器中设置环境变量"DNS_DOMAIN=cluster"和"POD_NAMESPACE=default"`kubectl run hazelcast --image=hazelcast --env="DNS_DOMAIN=cluster" --env="POD_NAMESPACE=default"`
  - 启动nginx实例，设置副本数5`kubectl run nginx --image=nginx --replicas=5`
  - 运行Dry打印相应的API对象而不创建它们`kubectl run nginx --image=nginx --dry-run`

### kubectl expose
1. 将资源暴露为新的Kubernetes Service。指定deployment、service、replica set、replication controller或pod,并使用该资源的选择器作为指定端口上新服务的选择器。deployment或replica set只有当其选择器可转换为service支持的选择器时，即当选择器仅包含matchLabels组件时才会作为暴露新的Service。资源包括(不区分大小写)：pod（po），service（svc），replication controller（rc），deployment（deploy），replica set（rs）
2. **语法** `kubectl expose (-f FILENAME | TYPE NAME) [--port=port] [--protocol=TCP|UDP] [--target-port=number-or-name] [--name=name] [--external-ip=external-ip-of-service] [--type=type]`
3. **示例**
  - 为RC的nginx创建service，并通过Service的80端口转发至容器的8000端口上`kubectl expose rc nginx --port=80 --target-port=8000`
  - 由“nginx-controller.yaml”中指定的type和name标识的RC创建Service，并通过Service的80端口转发至容器的8000端口上。`kubectl expose -f nginx-controller.yaml --port=80 --target-port=8000`

## Node
01. **添加标签** kubectl label no/nodeName labelKey=labelValue
02. **删除标签** kubectl label no/nodeName labelKey-

## Deployment
01. **创建对象** kubectl create -f yamlFile
02. **删除对象** kubectl delete -f yamlFile | kubectl delete deploy/deployName

