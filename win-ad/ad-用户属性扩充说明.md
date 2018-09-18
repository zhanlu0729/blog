### aaa
| 属性标志 | 说明 |十六进制值 |十进制值|
| --------- | ------------ |------------ |
|	SCRIPT     |将运行登录脚本	| 0x0001|  1 | 
|	ACCOUNTDISABLE     |	禁用用户帐户| 0x0002|  2 | 
|	HOMEDIR_REQUIRED     |需要主文件夹	| 0x0008|  8 | 
|	LOCKOUT     |	不需要密码| 0x0010|  16 | 
|	PASSWD_NOTREQD     |用户不能更改密码。可以读取此标志，但不能直接设置它	| 0x0020|  32 | 
|	PASSWD_CANT_CHANGE     |	| 0x0040|  64 | 
|	ENCRYPTED_TEXT_PWD_ALLOWED     |	用户可以发送加密的密码| 0x0080|  128 | 
|	TEMP_DUPLICATE_ACCOUNT     |	此帐户属于其主帐户位于另一个域中的用户。此帐户为用户提供访问该域的权限，但不提供访问信任该域的任何域的权限。有时将这种帐户称为“本地用户帐户”| 0x0100|  256 | 
|	NORMAL_ACCOUNT     |	这是表示典型用户的默认帐户类型| 0x0200|  512 | 
|	INTERDOMAIN_TRUST_ACCOUNT     |	对于信任其他域的系统域，此属性允许信任该系统域的帐户| 0x0800|  2048| 
|	WORKSTATION_TRUST_ACCOUNT     |这是运行 Microsoft Windows NT 4.0 Workstation、Microsoft Windows NT 4.0 Server、Microsoft Windows 2000 Professional 或 Windows 2000 Server 并且属于该域的计算机的计算机帐户	| 0x1000|  4096 | 
|	SERVER_TRUST_ACCOUNT     |	这是属于该域的域控制器的计算机帐户| 0x2000|  8192 | 
|	DONT_EXPIRE_PASSWORD     |	表示在该帐户上永远不会过期的密码| 0x10000|  65536 | 
|	MNS_LOGON_ACCOUNT     |	这是 MNS 登录帐户| 0x20000|  131072 | 
|	SMARTCARD_REQUIRED     |设置此标志后，将强制用户使用智能卡登录	| 0x40000|  262144 | 
|	TRUSTED_FOR_DELEGATION     |设置此标志后，将信任运行服务的服务帐户（用户或计算机帐户）进行 Kerberos 委派。任何此类服务都可模拟请求该服务的客户端。若要允许服务进行 Kerberos 委派，必须在服务帐户的userAccountControl 属性上设置此标志	| 0x80000|  524288 | 
|	NOT_DELEGATED     |设置此标志后，即使将服务帐户设置为信任其进行 Kerberos 委派，也不会将用户的安全上下文委派给该服务	| 0x100000|  1048576 | 
|	USE_DES_KEY_ONLY     |	将此用户限制为仅使用数据加密标准 (DES) 加密类型的密钥|0x200000|  2097152| 
|	DONT_REQ_PREAUTH     |此帐户在登录时不需要进行 Kerberos 预先验证	| 0x400000|  4194304 | 
|	PASSWORD_EXPIRED     |用户的密码已过期	| 0x800000|  8388608 | 
|	TRUSTED_TO_AUTH_FOR_DELEGATION     |允许该帐户进行委派。这是一个与安全相关的设置。应严格控制启用此选项的帐户。此设置允许该帐户运行的服务冒充客户端的身份，并作为该用户接受网络上其他远程服务器的身份验证	| 0x1000000|  16777216 | 


## DirectorySearcher.Filter属性扩充说明
| 筛选条件 | 值             |
| --------- | ------------ |
| 用户       | (&(objectCategory=person)(objectClass=user)) |
| 计算机     | (objectCategory=computer)  |
| 组         | (objectCategory=group)     |
| 联系人     | (objectCategory=contact)    |
| 共享文件夹 | (objectCategory=volume)     |
| 打印机     | (objectCategory=printQueue) |

## 用户属性扩充说明(含图文属性对照)
### 常项选项卡
| 对应编号 | 选项卡对应项名 |属性名|
| --------- | ------------ |------------ |
|①	|姓(L)	|sn |                           
|②	|名(F)	|givenName |                         
|③	|显示名称(S) |displayName |                         
|④	|描述(D)	|description |                           
|⑤	|办公室(C)	|physicalDeliveryOfficeName  |         
|⑥	|英文缩写(I)	|initials |                        
|⑦	|电话号码(T)	|telephoneNumber  |                  
|⑧	|电子邮件(M)	|mail  |                             
|⑨	|网页(W)|	wWWHomePage |                
|⑩	|电话号码-其它(O)...	|otherTelephone |                  
|⑪	|网页-其它(R)...	|url  |
### 地址选项卡
|对应编号	|选项卡对应项名	|属性名|
| --------- | ------------ |------------ |
|①	|国家/地区(O)	|co  |                             
|②	|省/自治区(V)	|st  |                                   
|③	|市/县(C)	|l|
|④	|街道(S)	|streetAddress|
|⑤	|邮政信箱(B)	|postOfficeBox|
|⑥	|邮政编码(Z)	|postalCode|
### 帐户选项卡
对应编号|	选项卡对应项名	|属性名|
| --------- | ------------ |------------ |
|①	用户登录名(U)	|userPrincipalName|
|②	用户登录名(Windows 2000 以前版本)(W)|	sAMAccountName|
### 电话选项卡
对应编号	|选项卡对应项名	|属性名|
| --------- | ------------ |------------ |
|①	 |家庭电话(M)	|homePhone |                          
|②	|寻呼机(P)	|pager|
|③	|移动电话(B)|	mobile|
|④	|传真(F)	|facsimileTelephoneNumber|
|⑤	|IP电话(I)	|ipPhone|
|⑥	|注释	|info|
|⑦	|家庭电话-其它(O)  |otherHomePhone |                   
|⑧	|寻呼机-其它(T)	|otherPager |                        
|⑨	|移动电话-其它(B)	|otherMobile |                         
|⑩	|传真-其它(E)	|otherFacsimileTelephoneNumber |         
|⑪	|IP电话-其它(R)	|otherIpPhone |
### 组织选项卡
|对应编号	|选项卡对应项名	|属性名|
| --------- | ------------ |------------ |
|①	|公司(C)  | company  |                            
|②	|部门(D)  |department |   
|③	|职务(J)  |  title|
|④	|经理-姓名(N)  | manager  |                 
|⑥	|直接下属(E)	|directReports|
