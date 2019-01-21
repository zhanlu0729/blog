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

### kubectl annotate
1. 更新一个或多个资源的Annotations信息
  - Annotations由key/value组成
  - Annotations的目的是存储辅助数据，特别是通过工具和系统扩展操作的数据，更多介绍在这里
  - 如果--overwrite为true，现有的annotations可以被覆盖，否则试图覆盖annotations将会报错
  - 如果设置了--resource-version，则更新将使用此resource version，否则将使用原有的resource version
2. **语法** `annotate [--overwrite] (-f FILENAME | TYPE NAME) KEY_1=VAL_1 ... KEY_N=VAL_N [--resource-version=version]`
3. 示例
  - 更新Pod“foo”，设置annotation “description”的value “my frontend”，如果同一个annotation多次设置，则只使用最后设置的value值。`kubectl annotate pods foo description='my frontend'`
  - 根据“pod.json”中的type和name更新pod的annotation`kubectl annotate -f pod.json description='my frontend'`
  - 更新Pod"foo"，设置annotation“description”的value“my frontend running nginx”，覆盖现有的值。`kubectl annotate --overwrite pods foo description='my frontend running nginx'`
  - 更新namespace中的所有pod`kubectl annotate pods --all description='my frontend running nginx'`
  - 只有当resource-version为1时，才更新pod ' foo '。`kubectl annotate pods foo description='my frontend running nginx' --resource-version=1`


## Node
01. **添加标签** kubectl label no/nodeName labelKey=labelValue
02. **删除标签** kubectl label no/nodeName labelKey-

## Deployment
01. **创建对象** kubectl create -f yamlFile
02. **删除对象** kubectl delete -f yamlFile | kubectl delete deploy/deployName

