## 安装MySQL
### 安装MySQL.rpm包
1. ``rpm -qa | grep -i mysql|mariadb`` 安装前检查是否有旧版本，如果有先卸载
2. ``rpm -ev mysql-version`` 卸载MySQL旧版
3. ``rpm -ev mariadb-server-version && rpm -ev mariadb-version && rpm -ev mariadb-libs-version --nodeps`` 卸载mariadb旧版
4. ``rpm -ivh myql-community-common-version.rpm && rpm -ivh myql-community-lib-version.rpm && rpm -ivh myql-community-server-version.rpm && rpm -ivh myql-community-client-version.rpm`` 这里我们只安装mysql-server服务，只需要安装如下4个软件包即可，使用``rpm -ivh``进行安装（按顺序安装，后面的服务依赖前面的服务），如果出现警告warning: myql-community-server-version.rpm: Header V3 DSA/SHA1 Signature, key ID 5072e1f5: NOKEY，原因：这是由于``yum``安装了旧版本的``GPG keys``造成的，解决办法：先安装依赖``yum install libaio | 
yum install net-tools``或者后面加上``--force --nodeps``
5. ``mysqld --initialize`` 初始化数据库,初始化后会在``/var/log/mysqld.log``生成随机密码
6. ``chown mysql:mysql /var/lib/mysql -R`` 修改mysql数据库目录的所属用户及其所属组，然后启动mysql数据库
7. ``systemctl enable|start|stop|restart|status mysqld.service``
8. ``mysql -uroot -p'xxxx' && set password=password('123456');`` 登录并更改密码
