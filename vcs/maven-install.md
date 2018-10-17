## 一、linux安装nexus
1. 创建文件夹并进入该目录 `cd /usr/local && mkdir nexus && cd nexus`
2. 下载nexus安装包 `wget http://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.6.0-02-unix.tar.gz`
3. 解压、重命名 `tar -zxvf nexus-3.6.0-02-unix.tar.gz`
`mv nexus-3.6.0-02  nexus`
4. 自定义配置虚拟机可打开 nexus.vmoptions 文件进行配置 `vim nexus/bin/nexus.vmoptions`
5. 启动nexus：`/usr/local/nexus/nexus/bin/nexus {start|stop|run|run-redirect|status|restart|force-reload}`
6. 其它说明：
  1）Nexus默认的端口是8081，可以在etc/nexus-default.properties配置中修改;
  2）Nexus默认的用户名密码是admin/admin123;
  3）当遇到奇怪问题时，重启nexus，启动时间会比较慢 要1分钟左右后才能访问;
  4）Nexus的工作目录是sonatype-work（路径一般在nexus同级目录下）.

## 二、仓库介绍
### 1、四种仓库类型介绍(默认仓库介绍)
1. maven-central：      maven中央库，默认从https://repo1.maven.org/maven2/拉取jar
2. maven-releases：   私库发行版jar
3. maven-snapshots：私库快照（调试版本）jar
4. maven-public：     仓库分组，把上面三个仓库组合在一起对外提供服务，在本地maven基础配置settings.xml中使用。

### 2、Nexus默认的仓库类型有以下四种：（上面的名字可以随便取，关键是它对应的是什么仓库类型）
1. group(仓库组类型)：又叫组仓库，用于方便开发人员自己设定的仓库；
2. hosted(宿主类型)：内部项目的发布仓库（内部开发人员，发布上去存放的仓库）；
3. proxy(代理类型)：  从远程中央仓库中寻找数据的仓库（可以点击对应的仓库的Configuration页签下Remote Storage Location属性的值即被代理的远程仓库的路径）；
4. virtual(虚拟类型)： 虚拟仓库（这个基本用不到，重点关注上面三个仓库的使用）；
5. Policy(策略):表示该仓库为发布(Release)版本仓库还是快照(Snapshot)版本仓库；

### 3、仓库拉取jar包流程
1. Maven可直接从宿主仓库下载构件,也可以从代理仓库下载构件,而代理仓库间接的从远程仓库下载并缓存构件
2. 为了方便,Maven可以从仓库组下载构件,而仓库组并没有时间的内容(下图中用虚线表示,它会转向包含的宿主仓库或者代理仓库获得实际构件的内容).

### 4、创建仓库
1. proxy代理仓库创建 作用是去远程拉取jar包
2. hosted仓库创建 作用是存放本地上传的三方jar包
3. group仓库 作用是将上面来个放到这个组里，进行统一管理
