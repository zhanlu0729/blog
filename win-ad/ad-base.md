## 概念

### 域控制器(DC)
1. **域控制器(Domain Controller|DC)** 域控制器是一台计算机,实现用户,计算机,目录的统一管理
2. [百度百科](https://baike.baidu.com/item/%E5%9F%9F%E6%8E%A7%E5%88%B6%E5%99%A8/8656707)

### LDAP
1. **LDAP** 是轻量目录访问协议，英文全称是Lightweight Directory Access Protocol，一般都简称为LDAP. 它是基于X.500标准的，但是简单多了并且可以根据需要定制。与X.500不同，LDAP支持TCP/IP，这对访问Internet是必须的。LDAP的核心规范在RFC中都有定义，所有与LDAP相关的RFC都可以在LDAPman RFC网页中找到
2. LDAP目录以树状的层次结构来存储数据
3. [百度百科](https://baike.baidu.com/item/LDAP/2875565)

### 活动目录(AD)
1. **活动目录(Active Directory|AD)** 是一种基于LDAP的存储协议,是面向Windows Standard Server、Windows Enterprise Server以及 Windows Datacenter Server的目录服务。Active Directory存储了有关网络对象的信息，并且让管理员和用户能够轻松地查找和使用这些信息。Active Directory使用了一种结构化的数据存储方式，并以此作为基础对目录信息进行合乎逻辑的分层组织，它为用户管理网络环境各个组成要素的标识和关系提供了一种有力的手段.
2. [百度百科](https://baike.baidu.com/item/%E6%B4%BB%E5%8A%A8%E7%9B%AE%E5%BD%95/1765909?fr=aladdin)

### 域控制器和活动目录的区别
**域控制器**和**活动目录** 完全是两种概念,DC也可以不基于AD实现,比如基于数据库或文件.


