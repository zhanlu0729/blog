###k8s常用命令
### kubectl run
1. 创建并运行一个或多个容器镜像; 创建一个deployment 或job 来管理容器.
2. 语法：`run NAME --image=image [--env="key=value"] [--port=port] [--replicas=replicas] [--dry-run=bool] [--overrides=inline-json] [--command] -- [COMMAND] [args...]`

## Node
01. **添加标签** kubectl label no/nodeName labelKey=labelValue
02. **删除标签** kubectl label no/nodeName labelKey-

## Deployment
01. **创建对象** kubectl create -f yamlFile
02. **删除对象** kubectl delete -f yamlFile | kubectl delete deploy/deployName

