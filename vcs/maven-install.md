## 一、linux安装nexus
1. 创建文件夹并进入该目录 `cd /usr/local && mkdir nexus && cd nexus`
2. 下载nexus安装包 `wget http://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.6.0-02-unix.tar.gz`
3. 解压、重命名 `tar -zxvf nexus-3.6.0-02-unix.tar.gz`
`mv nexus-3.6.0-02  nexus`
4. 自定义配置虚拟机可打开 nexus.vmoptions 文件进行配置 `vim nexus/bin/nexus.vmoptions`
5. 启动nexus 
启动 Nexus（默认端口是8081），Nexus常用的一些命令包括：`/usr/local/nexus/nexus/bin/nexus {start|stop|run|run-redirect|status|restart|force-reload}`，下面我们启动Nexus：
启动命令：`bin/nexus start`
