## maven 命令的格式为 mvn [plugin-name]:[goal-name]，可以接受的参数如下。
01. -D 指定参数，如 -Dmaven.test.skip=true 跳过单元测试；
02. -P 指定 Profile 配置，可以用于区分环境；
03. -e 显示maven运行出错的信息；
04. -o 离线执行命令,即不去远程仓库更新包；
05. -X 显示maven允许的debug信息；
06. -U 强制去远程更新snapshot的插件或依赖，默认每天只更新一次。

### 常用maven命令
01. 创建maven项目：mvn archetype:create 
02. 指定group： -DgroupId=packageName 
03. 指定artifact：-DartifactId=projectName
04. 创建web项目：-DarchetypeArtifactId=maven-archetype-webapp  
05. 创建maven项目：mvn archetype:generate
06. 验证项目是否正确：mvn validate
07. maven打包：mvn package
08. 只打jar包：mvn jar:jar
09. 生成源码jar包：mvn source:jar
10. 产生应用需要的任何额外的源代码：mvn generate-sources
11. 编译源代码： mvn compile
12. 编译测试代码：mvn test-compile
13. 运行测试：mvn test
14. 运行检查：mvn verify
15. 清理maven项目：mvn clean
16. 生成eclipse项目：mvn eclipse:eclipse
17. 清理eclipse配置：mvn eclipse:clean
18. 生成idea项目：mvn idea:idea
19. 安装项目到本地仓库：mvn install
20. 发布项目到远程仓库：mvn:deploy
21 在集成测试可以运行的环境中处理和发布包：mvn integration-test
22. 显示maven依赖树：mvn dependency:tree
23. 显示maven依赖列表：mvn dependency:list
24. 下载依赖包的源码：mvn dependency:sources
25. 安装本地jar到本地仓库：mvn install:install-file -DgroupId=packageName -DartifactId=projectName -Dversion=version -Dpackaging=jar -Dfile=path

### web项目相关命令
01. 启动tomcat：mvn tomcat:run
02. 启动jetty：mvn jetty:run
03. 运行打包部署：mvn tomcat:deploy
04. mvn tomcat:undeploy
05. 启动web应用：mvn tomcat:start
06. 停止web应用：mvn tomcat:stop
07. 重新部署：mvn tomcat:redeploy
08. 部署展开的war文件：mvn war:exploded tomcat:exploded  
