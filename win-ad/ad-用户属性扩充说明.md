## DirectorySearcher.Filter属性扩充说明
	
用户	
	
	
	
	
	

| 筛选条件 | 值 |
| --------- | ------------ |
| 用户       | (&(objectCategory=person)(objectClass=user)) |
| 计算机     | (objectCategory=computer)                    |
| 组         | (objectCategory=group)                       |
| 联系人     | (objectCategory=contact)                   |
| 共享文件夹 | (objectCategory=volume)                  |
| 打印机     | (objectCategory=printQueue) |

## 用户属性扩充说明(含图文属性对照)
### 常项选项卡
对应编号	选项卡对应项名	属性名
①	姓(L)	sn                                     
②	名(F)	givenName                              
③	显示名称(S)	displayName                            
④	描述(D)	description                            
⑤	办公室(C)	physicalDeliveryOfficeName             
⑥	英文缩写(I)	initials                               
⑦	电话号码(T)	telephoneNumber                        
⑧	电子邮件(M)	mail                                   
⑨	网页(W)	wWWHomePage                            
⑩	电话号码-其它(O)...	otherTelephone                         
⑪	网页-其它(R)...	url  
### 地址选项卡
对应编号	选项卡对应项名	属性名
①	国家/地区(O)	co                                      
②	省/自治区(V)	st                                      
③	市/县(C)	l
④	街道(S)	streetAddress
⑤	邮政信箱(B)	postOfficeBox
⑥	邮政编码(Z)	postalCode
### 帐户选项卡
对应编号	选项卡对应项名	属性名
①	用户登录名(U)	userPrincipalName
②	用户登录名(Windows 2000 以前版本)(W)	sAMAccountName
### 电话选项卡
对应编号	选项卡对应项名	属性名
①	 家庭电话(M)	homePhone                               
②	寻呼机(P)	pager
③	移动电话(B)	mobile
④	传真(F)	facsimileTelephoneNumber
⑤	IP电话(I)	ipPhone
⑥	注释	info
⑦	家庭电话-其它(O) 	otherHomePhone                          
⑧	寻呼机-其它(T)	otherPager                              
⑨	移动电话-其它(B)	otherMobile                             
⑩	传真-其它(E)	otherFacsimileTelephoneNumber           
⑪	IP电话-其它(R)	otherIpPhone      
### 组织选项卡
对应编号	选项卡对应项名	属性名
①	公司(C)                              	company                                  
②	部门(D)   	department            
③	职务(J)                        	title
④	经理-姓名(N)       	manager                   
⑥	直接下属(E)	directReports
