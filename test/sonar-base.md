## 故障排除
### 检查日志 如果您第一次（或以后任何时间）启动服务器时遇到问题，首先要检查服务器日志。你会在$ SONARQUBE_HOME / logs中找到它们  ：
1.sonar.log  - 记录主进程。包含有关启动和关闭的一般信息。您将获得整体状态，但不是详细信息。
2.web.log  - 有关数据库初始连接，数据库迁移和重建索引以及HTTP请求处理的信息。这包括与这些请求相关的数据库和搜索引擎日志。
3.ce.log  - 有关后台任务处理以及与这些任务相关的数据库和搜索引擎日志的信息。
4.es.log - 来自搜索引擎的Ops信息，例如Elasticsearch启动，运行状况更改，群集，节点和索引级别操作等。

### 服务器
|      键      |       描述       |      默认值     |
| ------ | ------ | ------ |
| sonar.host.url | 服务器URL | http://localhost:9000/ |

/sonar.sh { console | start | stop | restart | status | dump }
mvn sonar:sonar   -Dsonar.host.url=http://127.0.0.1:9000   -Dsonar.login=758dbe85559a1ae8ac2bd03ce931c4cf65197b02
