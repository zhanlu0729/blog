### LDAP的特定错误
1. **Error:** com.macromedia.contribute.server.exception.DBException: Error in bind() from LDAP source: [server]:[port] **错误：com.macromedia.contribute.server.exception.DBException：**绑定错误的（）从LDAP来源：[服务器]：[端口] 

**Cause:** This is a very general error, and it means something went wrong when trying to bind to LDAP/AD.原因：这是一个非常普遍的错误，它意味着出事时试图绑定到LDAP /广告。 Check to see if the LDAP/AD server name and/or port number you have specified is incorrect or an incorrect DN was specified as the administrator username.请检查是否在LDAP / AD服务器名称和/或您指定的端口号是不正确或不正确的DN作为管理员的用户名指定。 

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

Cause: Very general error when there is a problem finding the users in LDAP/AD. 原因：很一般的错误，当发现有问题/ AD的用户的LDAP。 Could be that the DN pointing to the users is pointing to the wrong place or is just incorrect and does not exist.可能是因为用户的DN指向指向错误的地方，或只是不正确，不存在。 

Note: For more detail look at the sub-exception, which can be 7 below. 注：如需例外的细节来看分，可7所示。
Error: javax.naming.NameNotFoundException: [LDAP: error code 32 - No Such Object]; remaining name '[DN]' 错误：javax.naming.NameNotFoundException：[LDAP的：错误代码32 -没有这样的对象];余下的名字'[肾病]' 

Cause: The DN path which points to where the users are located in the directory is invalid. 原因：DN路径指向的地方的用户目录位于无效。
Error: com.macromedia.contribute.server.exception.DBException: Error in searchForUserList from LDAP plugin: [LDAP: error code 2 - Bad search filter] 错误：com.macromedia.contribute.server.exception.DBException：插件错误的LDAP searchForUserList来自：[LDAP的：错误代码2 -错误的搜索过滤器] 

Cause: Invalid search filter passed to the LDAP/AD server. 原因：无效的搜索过滤器传递到LDAP / AD服务器。 

Note: For more detail look at the sub-exception, which can be 9, or 10 below. 注：如需例外的细节来看分，它可以是9或10以下。
Error: javax.naming.directory.InvalidSearchFilterException: Missing 'equals'; remaining name '[DN]' 错误：javax.naming.directory.InvalidSearchFilterException：缺少'等于';余下的名字'[肾病]' 

Cause: The filter specified is wrong or CPS constructed a bad filter. 原因：指定的过滤器或过滤准则是错误的构造坏。
Error: javax.naming.directory.InvalidSearchFilterException: Unbalanced parenthesis; remaining name [DN]错误：javax.naming.directory.InvalidSearchFilterException：括号不平衡;其余名称[肾病] 

Cause: You did not have correct opening and closing of parenthesis in your search filter. 原因：您没有正确的开启和关闭括号在您的搜索过滤器。
Error: Error in bind from LDAP source: [LDAP: error code 49 - Invalid Credentials] javax.naming.AuthenticationException 错误：源错误的LDAP绑定来自：[LDAP的：错误代码49 -无效凭据] javax.naming.AuthenticationException 

Cause: Could not authenticate the user trying to login. 原因：无法验证的用户试图登录。 This can be the result of an incorrect username or password, or an incorrect prefix and/or suffix specified in the Settings tab, depending on the type of LDAP/AD system.这可以是一个不正确的用户名或密码，或不正确的前缀和结果/或后缀指定在设置选项卡，根据的LDAP /广告系统类型。 Could also mean the authentication type is incorrect.可能也意味着是不正确的身份验证类型。
Error: Error in bind from LDAP source: [LDAP: error code 34 - invalid DN] javax.naming.InvalidNameException 错误：源错误的LDAP绑定来自：[LDAP的：错误代码34 -无效的DN] javax.naming.InvalidNameException 

Cause: This is caused by a bad prefix specified in the Settings tab, on most LDAP/AD systems. 原因：这是系统设置造成坏指定前缀广告标签，大多数LDAP /。 This could mean you did not specify a prefix at all, which means the LDAP/AD server did not receive a full DN from CPS or that you did not specify a correct prefix, such as CN instead of UID, which results in the LDAP/AD server not receiving a correct DN from CPS.这可能意味着你没有在所有指定的前缀，这意味着在LDAP / AD服务器没有收到完整DN从准则，或者你没有指定，如不是的UID，它在LDAP结果架CN正确的前缀，/ AD服务器没有收到来自准则正确的DN。 Can also be caused by a missing comma at the beginning of the suffix or an extra comma at the end of the suffix.也可以是由一个在后缀或一个额外的逗号在后缀月底开始失踪逗号。 This error could also mean the authentication type is incorrect.此错误可能也意味着是不正确的身份验证类型。
Error: NoSuchAttributeException 错误：NoSuchAttributeException 

Cause: This is caused by providing a name for an attribute which is not correct or does not exist. 原因：这是由于不存在提供一个名称的属性是不正确或。
