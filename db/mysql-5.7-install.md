## 安装MySQL
### 安装MySQL.rpm包
1. rpm -ivh myql-community-server-version.rpm，如果出现警告warning: myql-community-server-version.rpm: Header V3 DSA/SHA1 Signature, key ID 5072e1f5: NOKEY，原因：这是由于``yum``安装了旧版本的``GPG keys``造成的，解决办法：后面加上``--force --nodeps``
