热部署可以使的修改代码后，无须重启服务器，就可以加载更改的代码。

第1种：修改服务器配置，使得IDEA窗口失去焦点时，更新类和资源

菜单Run -> EditConfiguration , 然后配置指定服务器下，右侧server标签下on frame deactivation = Update classes and resource。

优点：简单

缺点：基于JVM提供的热加载仅支持方法块内代码修改，只有debug模式下，并且是在idea失去焦点时才会出发热加载，相对加载速度缓慢

第2种：使用springloaded jar包

a. 下载jar包，github：https://github.com/spring-projects/spring-loaded
b. 启动应用时添加VM启动参数：-javaagent:/home/lkqm/.m2/repository/org/springframework/springloaded/1.2.7.RELEASE/springloaded-1.2.7.RELEASE.jar -noverify

优点：对Spring系列框架支持好（不含Spring boot）, 支持 成员级别的修改（增删改方法、字段、注解），支持对枚举值集。

缺点：与优点相对

第3种：使用spring-boot-devtools提供的开发者工具

spring-boot项目中引入如下依赖

<dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-devtools</artifactId>
 </dependency>
优点：简单，支持Spring-boot项目，支持成员级别的修改热部署。

缺点：只支持spring-boot项目。

第4种：使用Jrebel插件实现热部署(该插件14天免费试用)

在线安装：菜单File -> Setting -> Plugin, 点击右侧底部 Browse repositories, 弹出框顶部输入:JReble for Intellij， 选中安装即可。

优点：强大，对各类框架支持，并且提供IDE插件的方式。

最后3种方法是基于类加载机制来实现热加载的，因此你修改完成代码后必须重新编译当前代码，才能触发热部署，Eclipse默认就支持了自动编译，而在Intellij IDEA中默认是关闭了自动编译的，可以按照如下2步设置开启：

IDEA开启项目自动编译，进入设置，Build,Execut, Deployment -> Compiler 勾选中左侧的Build Project automatically
IDEA开启项目运行时自动make, ctrl + shift + a搜索命令：registry -> 勾选compiler.automake.allow.when.app.running
