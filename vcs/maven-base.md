### Maven命令的格式为 mvn [plugin-name]:[goal-name]，可以接受的参数如下。
01. **-D** 指定参数，如 `-Dmaven.test.skip=true` 跳过单元测试；
02. **-P** 指定 Profile 配置，可以用于区分环境；
03. **-e** 显示maven运行出错的信息；
04. **-o** 离线执行命令,即不去远程仓库更新包；
05. **-X** 显示maven允许的debug信息；
06. **-U** 强制去远程更新snapshot的插件或依赖，默认每天只更新一次。

### 常用Maven命令
01. 创建maven项目：`mvn archetype:create `
02. 指定group： `-DgroupId=packageName `
03. 指定artifact：`-DartifactId=projectName`
04. 创建web项目：`-DarchetypeArtifactId=maven-archetype-webapp  `
05. 创建maven项目：`mvn archetype:generate`
06. 验证项目是否正确：`mvn validate`
07. maven打包：`mvn package`
08. 只打jar包：`mvn jar:jar`
09. 生成源码jar包：`mvn source:jar`
10. 产生应用需要的任何额外的源代码：`mvn generate-sources`
11. 编译源代码： `mvn compile`
12. 编译测试代码：`mvn test-compile`
13. 运行测试：`mvn test`
14. 运行检查：`mvn verify`
15. 清理maven项目：`mvn clean`
16. 生成eclipse项目：`mvn eclipse:eclipse`
17. 清理eclipse配置：`mvn eclipse:clean`
18. 生成idea项目：`mvn idea:idea`
19. 安装项目到本地仓库：`mvn install`
20. 发布项目到远程仓库：`mvn:deploy`
21 在集成测试可以运行的环境中处理和发布包：`mvn integration-test`
22. 显示maven依赖树：`mvn dependency:tree`
23. 显示maven依赖列表：`mvn dependency:list`
24. 下载依赖包的源码：`mvn dependency:sources`
25. 安装本地jar到本地仓库：`mvn install:install-file -DgroupId=packageName -DartifactId=projectName -Dversion=version -Dpackaging=jar -Dfile=path`

### web项目相关命令
01. 启动tomcat：`mvn tomcat:run`
02. 启动jetty：`mvn jetty:run`
03. 运行打包部署：`mvn tomcat:deploy`
04. 卸载部署：`mvn tomcat:undeploy`
05. 启动web应用：`mvn tomcat:start`
06. 停止web应用：`mvn tomcat:stop`
07. 重新部署：`mvn tomcat:redeploy`
08. 部署展开的war文件：`mvn war:exploded tomcat:exploded`

## 一、坐标详解
### 1、何为Maven坐标
maven定义了这样一组规则：世界上任何一个构件都可以使用maven坐标唯一标识，坐标元素包括：groupId、artifactId、version、packaging、classifier。只要提供正确的坐标就能从仓库中找到相应的构件供我们使用。maven从哪里下载构件呢？答：maven内置了一个中央仓库的地址，该中央仓库包含了世界上大部分流行的开源构件。
### 2、坐标详解
任何构件都必须明确定义自己的坐标，而一组maven坐标是通过一些元素定义的，他们是：groupId、artifactId、version、packaging、classifier。先看一组坐标定义如下
```<groupId>org.sonatype.nexus</groupId>
  <artifactId>nexus-indexer</artifactId>
  <version>2.0.0</version>
  <packaging>jar</packaging>
```
这是nexus-indexer项目的坐标，nexus-indexer是一个对maven仓库编纂索引并提供搜索功能的类库，它是Nexus项目的一个子模块。
1. goupId: 定义了当前maven项目隶属的实际项目，一般是域名+项目名。比如：com.alibaba.taotao
2. artifactId：该元素定义实际项目中的一个maven项目（模块，一般推荐项目名+子模块名。比如：taobao-web
3. version： 定义maven项目当前所处版本。
4. packaging：定义maven项目的打包方式，默认使用jar。
5. classifier：该元素用来帮助定义构件输出的一些附属构件。
6. 上述5元素groupId、artifactId、version是必须的，packaging可选，默认jar，classifier不能直接定义。同时，项目构件的文件名是与坐标对应的，一般的规则为artificatId-version[-classifier].packaging。packing并非一定与构件扩展名对应，比如packing为maven-plugin的构件扩展名为jar。

## 二、依赖详解
### 1、依赖的配置
gourpId、artifactId、version：依赖的基本坐标，对于任何一个依赖来说，基本坐标是最重要的，maven根据坐标才能找到需要的依赖。
1. type：依赖的类型，对于项目坐标定义的packing，大部分情况是不必声明，默认是jar。
2. scope ：依赖的范围 下面具体讲解
3. optional: 标记依赖是否可选，值为true或false，默认为false, 如果为可选依赖，则依赖不具有传递性。即B->X(可选依赖)，A->B。此时A的依赖中不包含X。
4. exclusions：用来排除传递性依赖。
5. 大部分依赖声明只包含基本坐标，然而在一些特殊情况下，其他元素至关重要。

### 2、classpath
classpath：用于指定.class文件存放的位置，类加载器会从该路径中加载所需的.class文件到内存中。maven在编译、执行测试、实际运行有着三套不同的classpath。
1. 编译classpath：编译主代码有效
2. 测试classpath：编译、运行测试代码有效
3. 运行classpath：项目运行时有效

### 3、依赖范围scope
1. compile：编译依赖范围。（默认方式），有效范围：编译classpath+测试classpath+运行classpath。
2. test：测试依赖范围。有效范围：测试classpath  比如：JUnit，只在测试时使用，在编译主代码和运行时不需要此依赖。
3. provided：已提供依赖范围。有效范围：编译classpath+测试classpath。
4. runtime：运行时依赖范围。有效范围：测试classpath+运行classpath。比如：JDBC驱动实现（mysql-connector-java）。
5. system：系统依赖范围。有效范围：编译classpath+测试classpath。使用system范围的依赖时必须通过systemPath元素显示地指定依赖文件的路径，因为此类依赖不是通过maven仓库解析的，而且往往与本地及其系统绑定，可能造成构建的不可移植，慎用。systemPath元素可以引用环境变量。
