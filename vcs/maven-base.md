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
1. ``goupId``: 定义了当前maven项目隶属的实际项目，一般是域名+项目名。比如：com.alibaba.taotao
2. ``artifactId``：该元素定义实际项目中的一个maven项目（模块，一般推荐项目名+子模块名。比如：taobao-web
3. ``version``： 定义maven项目当前所处版本。
4. ``packaging``：定义maven项目的打包方式，默认使用jar。
5. ``classifier``：该元素用来帮助定义构件输出的一些附属构件。
6. 上述5元素groupId、artifactId、version是必须的，packaging可选，默认jar，classifier不能直接定义。同时，项目构件的文件名是与坐标对应的，一般的规则为artificatId-version[-classifier].packaging。packing并非一定与构件扩展名对应，比如packing为maven-plugin的构件扩展名为jar。

## 二、依赖详解
### 1、依赖的配置
gourpId、artifactId、version：依赖的基本坐标，对于任何一个依赖来说，基本坐标是最重要的，maven根据坐标才能找到需要的依赖。
1. ``type``：依赖的类型，对于项目坐标定义的packing，大部分情况是不必声明，默认是jar。
2. ``scope``：依赖的范围，参见``3、依赖范围scope``
3. ``optional``: 标记依赖是否可选，值为true或false，默认为false, 如果为可选依赖，则依赖不具有传递性。即B->X(可选依赖)，A->B。此时A的依赖中不包含X。
4. ``exclusions``：用来排除传递性依赖。
5. 大部分依赖声明只包含基本坐标，然而在一些特殊情况下，其他元素至关重要。

### 2、classpath
classpath：用于指定.class文件存放的位置，类加载器会从该路径中加载所需的.class文件到内存中。maven在编译、执行测试、实际运行有着三套不同的classpath。
1. ``编译classpath``：编译主代码有效
2. ``测试classpath``：编译、运行测试代码有效
3. ``运行classpath``：项目运行时有效

### 3、依赖范围scope
1. ``compile``：编译依赖范围。（默认方式），有效范围：编译classpath+测试classpath+运行classpath。
2. ``test``：测试依赖范围。有效范围：测试classpath 比如：JUnit，只在测试时使用，在编译主代码和运行时不需要此依赖。
3. ``provided``：已提供依赖范围。有效范围：编译classpath+测试classpath。
4. ``runtime``：运行时依赖范围。有效范围：测试classpath+运行classpath。比如：JDBC驱动实现（mysql-connector-java）。
5. ``system``：系统依赖范围。有效范围：编译classpath+测试classpath。使用system范围的依赖时必须通过systemPath元素显示地指定依赖文件的路径，因为此类依赖不是通过maven仓库解析的，而且往往与本地及其系统绑定，可能造成构建的不可移植，慎用。systemPath元素可以引用环境变量。

### mvn命令行参数
1. `mvn -v, –version` 显示版本信息;
1. `mvn -V, –show-version` 显示版本信息后继续执行Maven其他目标;
1. `mvn -h, –help` 显示帮助信息; mvn -e, –errors 控制Maven的日志级别,产生执行错误相关消息;
1. `mvn -X, –debug` 控制Maven的日志级别,产生执行调试信息;
1. `mvn -q, –quiet` 控制Maven的日志级别,仅仅显示错误;
1. `mvn -Pxxx` 激活 id 为 xxx的profile (如有多个，用逗号隔开);
1. `mvn -Dxxx=yyy` 指定Java全局属性;
1. `mvn -o , –offline` 运行offline模式,不联网更新依赖;
1. `mvn -N, –non-recursive` 仅在当前项目模块执行命令,不构建子模块;
1. `mvn -pl, –module_name` 在指定模块上执行命令;
1. `mvn -ff, –fail-fast` 遇到构建失败就直接退出;
1. `mvn -fn, –fail-never` 无论项目结果如何,构建从不失败;
1. `mvn -fae, –fail-at-end` 仅影响构建结果,允许不受影响的构建继续;
1. `mvn -C, –strict-checksums` 如果校验码不匹配的话,构建失败;
1. `mvn -c, –lax-checksums` 如果校验码不匹配的话,产生告警;
1. `mvn -U` 强制更新snapshot类型的插件或依赖库(否则maven一天只会更新一次snapshot依赖);
1. `mvn -npu, –no-plugin-updates` 对任何相关的注册插件,不进行最新检查(使用该选项使Maven表现出稳定行为，该稳定行为基于本地仓库当前可用的所有插件版本);
1. `mvn -cpu`, –check-plugin-updates 对任何相关的注册插件,强制进行最新检查(即使项目POM里明确规定了Maven插件版本,还是会强制更新);
1. `mvn -up`, –update-plugins [mvn -cpu]的同义词;
1. `mvn -B`, –batch-mode 在非交互（批处理）模式下运行(该模式下,当Mven需要输入时,它不会停下来接受用户的输入,而是使用合理的默认值);
1. `mvn -f`, –file 强制使用备用的POM文件; mvn -s, –settings 用户配置文件的备用路径;
1. `mvn -gs`, –global-settings 全局配置文件的备用路径;
1. `mvn -emp`, –encrypt-master-password 加密主安全密码,存储到Maven settings文件里;
1. `mvn -ep`, –encrypt-password 加密服务器密码,存储到Maven settings文件里;
1. `mvn -npr`, –no-plugin-registry 对插件版本不使用~/.m2/plugin-registry.xml(插件注册表)里的配置
