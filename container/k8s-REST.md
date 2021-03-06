## ReplicationController
01. **POST** /api/v1/namespaces/{namespace}/replicationcontrollers
02. **PUT** /api/v1/namespaces/{namespace}/replicationcontrollers/{name}
03. **PATCH** /api/v1/namespaces/{namespace}/replicationcontrollers/{name}
04. **DELETE** /api/v1/namespaces/{namespace}/replicationcontrollers/{name}
05. **DELETE Collection** /api/v1/namespaces/{namespace}/replicationcontrollers
06. **GET** /api/v1/namespaces/{namespace}/replicationcontrollers/{name}
07. **GET List** /api/v1/namespaces/{namespace}/replicationcontrollers

## StatefulSet
01. **POST** /apis/apps/v1beta1/namespaces/{namespace}/statefulsets
02. **PUT** /apis/apps/v1beta1/namespaces/{namespace}/statefulsets/{name}
03. **PATCH** /apis/apps/v1beta1/namespaces/{namespace}/statefulsets/{name}
04. **DELETE** /apis/apps/v1beta1/namespaces/{namespace}/statefulsets/{name}
05. **DELETE Collection** /apis/apps/v1beta1/namespaces/{namespace}/statefulsets
06. **GET** /apis/apps/v1beta1/namespaces/{namespace}/statefulsets/{name}
07. **GET List** /apis/apps/v1beta1/namespaces/{namespace}/statefulsets

## Deployment
01. **POST** /apis/apps/v1beta1/namespaces/{namespace}/deployments
02. **PUT** /apis/apps/v1beta1/namespaces/{namespace}/deployments/{name}
03. **PATCH** /apis/apps/v1beta1/namespaces/{namespace}/deployments/{name}
04. **DELETE** /apis/apps/v1beta1/namespaces/{namespace}/deployments/{name}
05. **DELETE Collection** /apis/apps/v1beta1/namespaces/{namespace}/deployments
06. **GET** /apis/apps/v1beta1/namespaces/{namespace}/deployments/{name}
07. **GET List** /apis/apps/v1beta1/namespaces/{namespace}/deployments

## ReplicaSet
01. **POST** /apis/extensions/v1beta1/namespaces/{namespace}/replicasets
02. **PUT** /apis/extensions/v1beta1/namespaces/{namespace}/replicasets/{name}
03. **PATCH** /apis/extensions/v1beta1/namespaces/{namespace}/replicasets/{name}
04. **DELETE** /apis/extensions/v1beta1/namespaces/{namespace}/replicasets/{name}
05. **DELETE Collection** /apis/extensions/v1beta1/namespaces/{namespace}/replicasets
06. **GET** /apis/extensions/v1beta1/namespaces/{namespace}/replicasets/{name}
07. **GET List** /apis/extensions/v1beta1/namespaces/{namespace}/replicasets

## Pod
01. **POST** /api/v1/namespaces/{namespace}/pods
02. **PUT** /api/v1/namespaces/{namespace}/pods/{name}
03. **PATCH** /api/v1/namespaces/{namespace}/pods/{name}
04. **DELETE** /api/v1/namespaces/{namespace}/pods/{name}
05. **DELETE Collection** /api/v1/namespaces/{namespace}/pods
06. **GET** /api/v1/namespaces/{namespace}/pods/{name}
07. **GET List** /api/v1/namespaces/{namespace}/pods
08. **GET All Namespaces** /api/v1/pods
09. **GET Watch** /api/v1/watch/namespaces/{namespace}/pods/{name}
10. **GET Watch List** /api/v1/watch/namespaces/{namespace}/pods
11. **GET Watch List All Namespaces** /api/v1/watch/pods
12. **PUT Status** /api/v1/namespaces/{namespace}/pods/{name}/status
13. **PATCH Status** /api/v1/namespaces/{namespace}/pods/{name}/status
14. **GET Status** /api/v1/namespaces/{namespace}/pods/{name}/status

## CronJob
01. **POST** /apis/batch/v2alpha1/namespaces/{namespace}/cronjobs
02. **PUT** /apis/batch/v2alpha1/namespaces/{namespace}/cronjobs/{name}
03. **PATCH** /apis/batch/v2alpha1/namespaces/{namespace}/cronjobs/{name}
04. **DELETE** /apis/batch/v2alpha1/namespaces/{namespace}/cronjobs/{name}
05. **DELETE Collection** /apis/batch/v2alpha1/namespaces/{namespace}/cronjobs
06. **GET** /apis/batch/v2alpha1/namespaces/{namespace}/cronjobs/{name}
07. **GET List** /apis/batch/v2alpha1/namespaces/{namespace}/cronjobs
