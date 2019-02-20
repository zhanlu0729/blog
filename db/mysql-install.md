## 安装MySQL
### 安装MySQL-5.7.rpm包
1. `groupadd mysql` 添加用户组mysql
2. `useradd -g mysql mysql -s /bin/false` 添加用户mysql且该用户不能登陆
3. `rpm -qa | grep -i mysql|mariadb` 安装前检查是否有旧版本，如果有先卸载
4. `rpm -ev mysql-version` 卸载MySQL旧版
5. `rpm -ev mariadb-server-version && rpm -ev mariadb-version && rpm -ev mariadb-libs-version --nodeps` 卸载mariadb旧版
6. `rm -f mysql-community-server-minimal-version.rpm` -- 这个要删掉，不然Transaction check error
7. `yum install mysql-community-{server,client,common,libs}-* -y` 这里我们只安装mysql-server服务，只需要安装如下4个软件包即可，使用`rpm -ivh`进行安装（按顺序安装，后面的服务依赖前面的服务），如果出现警告warning: myql-community-server-version.rpm: Header V3 DSA/SHA1 Signature, key ID 5072e1f5: NOKEY，原因：这是由于`yum`安装了旧版本的`GPG keys`造成的，解决办法：先安装依赖`yum install libaio | 
yum install net-tools`或者后面加上`--force --nodeps`
8. `mysqld --initialize --user=mysql --datadir=/data/mysql` 初始化数据库,初始化后会在`/var/log/mysqld.log`生成随机密码
9. `chown mysql:mysql /var/lib/mysql -R` 修改mysql数据库目录的所属用户及其所属组，然后启动mysql数据库
10. `systemctl enable|start|stop|restart|status mysqld.service`
11. `mysql -uroot -p'xxxx'` 登录
12. `set password=password('123456');` 更改密码
13. `skip-grant-tables` 忘记密码时，修改`/etc/my.cnf`添加这个参数，可以免登录：
```
mysql> use mysql;
mysql> update user set authentication_string=password('pwd') where user='root';
mysql> flush privileges;
mysql> quit
```
