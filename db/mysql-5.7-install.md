## 安装MySQL
### 安装MySQL.rpm包
1. rpm -qa | grep -i mysql 安装前检查是否有旧版本，如果有先卸载
2. rpm -ev mysql-version 卸载旧版本
3. rpm -ivh myql-community-server-version.rpm，如果出现警告warning: myql-community-server-version.rpm: Header V3 DSA/SHA1 Signature, key ID 5072e1f5: NOKEY，原因：这是由于``yum``安装了旧版本的``GPG keys``造成的，解决办法：后面加上``--force --nodeps``
4. service mysql start|stop|restart|status
