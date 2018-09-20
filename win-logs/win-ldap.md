## LDAP
LDAP是轻量目录访问协议，英文全称是Lightweight Directory Access Protocol，一般都简称为LDAP。它是基于X.500标准的，但是简单多了并且可以根据需要定制。与X.500不同，LDAP支持TCP/IP，这对访问Internet是必须的。LDAP的核心规范在RFC中都有定义，所有与LDAP相关的RFC都可以在LDAPman RFC网页中找到。

### 目录结构
LDAP目录以树状的层次结构来存储数据。如果你对自顶向下的DNS树或UNIX文件的目录树比较熟悉，也就很容易掌握LDAP目录树这个概念了。就象DNS的主机名那样，LDAP目录记录的标识名（Distinguished Name，简称DN）是用来读取单个记录，以及回溯到树的顶部。后面会做详细地介绍。
