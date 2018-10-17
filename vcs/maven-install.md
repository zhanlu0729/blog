## 一、linux安装nexus
1. 创建文件夹并进入该目录 `cd /usr/local && mkdir nexus && cd nexus`
2. 下载nexus安装包 `wget http://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.6.0-02-unix.tar.gz`
3. 解压、重命名 `tar -zxvf nexus-3.6.0-02-unix.tar.gz`
`mv nexus-3.6.0-02  nexus`
4. 自定义配置虚拟机可打开 nexus.vmoptions 文件进行配置 `vim nexus/bin/nexus.vmoptions`
5. 启动nexus(默认端口是8081)：`/usr/local/nexus/nexus/bin/nexus {start|stop|run|run-redirect|status|restart|force-reload}`
6. 其它说明 
  1）Nexus默认的端口是8081，可以在etc/nexus-default.properties配置中修改。
  2）Nexus默认的用户名密码是admin/admin123
  3）当遇到奇怪问题时，重启nexus，启动时间会比较慢 要1分钟左右后才能访问。
  4）Nexus的工作目录是sonatype-work（路径一般在nexus同级目录下）
