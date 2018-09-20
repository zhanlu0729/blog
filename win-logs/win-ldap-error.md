### LDAP的特定错误
1. **Error:** com.macromedia.contribute.server.exception.DBException: Error in bind() from LDAP source: [server]:[port] **错误：com.macromedia.contribute.server.exception.DBException：** 绑定错误的（）从LDAP来源：[服务器]：[端口] 
**Cause:** This is a very general error, and it means something went wrong when trying to bind to LDAP/AD.原因：这是一个非常普遍的错误，它意味着出事时试图绑定到LDAP /广告。Check to see if the LDAP/AD server name and/or port number you have specified is incorrect or an incorrect DN was specified as the administrator username.请检查是否在LDAP / AD服务器名称和/或您指定的端口号是不正确或不正确的DN作为管理员的用户名指定。 
**Notes:** For more detail look at the sub-exception, which can be 1,2,3,4 or 5 below. 注：如需例外的细节来看分，可1,2,3,4或5以下。

2. **Error:** javax.naming.CommunicationException: [server]:[port] [Root exception is java.net.ConnectException: Connection refused: connect] **错误：javax.naming.CommunicationException：**[服务器]：[端口] [根异常java.net.ConnectException：连接被拒绝：连接] 
**Cause:** The port name you have specified for the LDAP/AD server is incorrect. 原因：你有服务器的端口名指定为LDAP / AD是不正确的。

3. **Error:** javax.naming.CommunicationException: [server]:[port] [Root exception is java.net.UnknownHostException: [server]] **错误：javax.naming.CommunicationException：**[服务器]：[端口] [根异常java.net.UnknownHostException：[服务器]] 
**Cause:** The LDAP/AD server name you have specified is incorrect. 原因：的LDAP / AD服务器名称指定是不正确的。
Error: javax.naming.NamingException: Cannot parse url: [protocol]://[server]:[port] [Root exception is java.net.MalformedURLException: Not an LDAP URL: [protocol]://[server]:[port]] 错误：javax.naming.NamingException：无法解析网址：[协议]://[服务器]：[端口] [根异常java.net.MalformedURLException：不是一个LDAP网址：[协议]://[服务器]： [港口]] 

Cause: The protocol you have specified is not correct. 原因：您指定的协议的，是不正确的。 

Note: Currently if you specify anything besides ldap for the protocol, you will receive this error. 注：目前，如果您指定的LDAP协议的任何内容，除了对，您将收到此错误。
Error: javax.naming.AuthenticationException: [LDAP: error code 49 - Invalid Credentials] 错误：javax.naming.AuthenticationException：[LDAP的：错误代码49 -无效证书] 

Cause: The DN path or password which you have specified for the administrator is invalid. 原因：DN路径或管理员密码，你必须指定为无效。 Any of the below will result in this error:任何下文将导致此错误：
Pointed to non-user DN指出，非用户的DN
Pointed to a non-existent user, but in existing DN指出了一个不存在的用户，但在现有的DN
Pointed to non existent DN指出不存在的DN
Pointed to an existing user, but non existing DN指出，现有的用户，但现有的DN非
Pointed to an incorrect admin DN, uid instead of cn指出，一个不正确的管理员的DN，而不是架CN的UID
Pointed to a non administrator user指着一个非管理员用户
Pointed to a valid admin but password is incorrect指出了一个有效的管理员密码是不正确的，但
Error: com.macromedia.contribute.server.exception.DBException: Error in searchForUserList from LDAP plugin: [LDAP: error code 32 - No Such Object] 错误：com.macromedia.contribute.server.exception.DBException：插件错误的LDAP searchForUserList来自：[LDAP的：错误代码32 -没有这样的对象] 

https://blog.csdn.net/zdwzzu2006/article/details/8550910
