## 安装MySQL
### 安装MySQL.rpm包
1. ``rpm -qa | grep -i mysql|mariadb`` 安装前检查是否有旧版本，如果有先卸载
2. ``rpm -ev mysql-version`` 卸载MySQL旧版
3. ``rpm -ev mariadb-server-version && rpm -ev mariadb-version && rpm -ev mariadb-libs-version --nodeps`` 卸载mariadb旧版
4. ``rpm -ivh myql-community-common-version.rpm && rpm -ivh myql-community-lib-version.rpm && rpm -ivh myql-community-server-version.rpm && rpm -ivh myql-community-client-version.rpm``
5. ``rpm -ivh myql-community-server-version.rpm``，如果出现警告warning: myql-community-server-version.rpm: Header V3 DSA/SHA1 Signature, key ID 5072e1f5: NOKEY，原因：这是由于``yum``安装了旧版本的``GPG keys``造成的，解决办法：后面加上``--force --nodeps``
6. ``mysqld --initialize`` 初始化后会在/var/log/mysqld.log生成随机密码
7. ``chown mysql:mysql /var/lib/mysql -R`` 授权
8. ``systemctl start|stop|restart|status mysqld.service``
