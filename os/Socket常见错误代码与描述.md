### Socket常见错误
1. 错误代码10061， 说明服务器已经找到，但连接被服务器拒绝，连接失败原因可能是：端口号设置错误；
2. 服务器没有处于监听状态 （即ServerSocket –>Active=true）；
3. 数据包被服务器端的防火墙过滤掉。

### Socket常见错误代码与描述
1. Socket error 0 – Directly send error 
2. Socket error 10004 – Interrupted function //call 操作被终止 
3. Socket error 10013 – Permission denied //c访问被拒绝 
4. Socket error 10014 – Bad address //c地址错误 
5. Socket error 10022 – Invalid argument //参数错误 
6. Socket error 10024 – Too many open files // 打开太多的sockets 
7. Socket error 10035 – Resource temporarily unavailable // 没有可以获取的资料 
8. Socket error 10036 – Operation now in progress // 一个阻塞操作正在进行中 
9. Socket error 10037 – Operation already in progress // 操作正在进行中 
10. Socket error 10038 – Socket operation on non-socket //非法的socket对象在操作 
11. Socket error 10039 – Destination address required //目标地址错误 
12. Socket error 10040 – Message too long //数据太长 
13. Socket error 10041 – Protocol wrong type for socket //协议类型错误 
14. Socket error 10042 – Bad protocol option // 错误的协议选项 
15. Socket error 10043 – Protocol not supported //协议不被支持 
16. Socket error 10044 – Socket type not supported //socket类型不支持 
17. Socket error 10045 – Operation not supported //不支持该操作 
18. Socket error 10046 – Protocol family not supported //协议族不支持 
19. Socket error 10047 – Address family not supported by protocol family//使用的地址族不在支持之列 
20. Socket error 10048 – Address already in use //地址已经被使用 
21. Socket error 10049 – Cannot assign requested address //地址设置失败 
22. Socket error 10050 – Network is down //网络关闭 
23. Socket error 10051 – Network is unreachable //网络不可达 
24. Socket error 10052 – Network dropped connection on reset //网络被重置 
25. Socket error 10053 – Software caused connection abort //软件导致连接退出 
26. Socket error 10054 – connection reset by peer //连接被重置 
27. Socket error 10055 – No buffer space available //缓冲区不足 
28. Socket error 10056 – Socket is already connected // socket已经连接 
29. Socket error 10057 – Socket is not connected //socket没有连接 
30. Socket error 10058 – Cannot send after socket shutdown //socket已经关闭 
31. Socket error 10060 – Connection timed out //超时 
32. Socket error 10061 – Connection refused //连接被拒绝 
33. Socket error 10064 – Host is down //主机已关闭 
34. Socket error 10065 – No route to host // 没有可达的路由 
35. Socket error 10067 – Too many processes //进程太多 
36. Socket error 10091 – Network subsystem is unavailable //网络子系统不可用 
37. Socket error 10092 – WINSOCK.DLL version out of range //winsock.dll版本超出范围 
38. Socket error 10093 – Successful WSAStartup not yet performed //没有成功执行WSAStartup 
39. Socket error 10094 – Graceful shutdown in progress // 
40. Socket error 11001 – Host not found //主机没有找到 
41. Socket error 11002 – Non-authoritative host not found // 非授权的主机没有找到 
42. Socket error 11003 – This is a non-recoverable error //这是个无法恢复的错误 
43. Socket error 11004 – Valid name, no data record of requested type //请求的类型的名字或数据错误 
