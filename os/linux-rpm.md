## rpm 执行安装包
二进制包（Binary）以及源代码包（Source）两种。二进制包可以直接安装在计算机中，而源代码包将会由RPM自动编译、安装。源代码包经常以src.rpm作为后缀名
### 常用命令组合：
1. －ivh：安装显示安装进度--install--verbose--hash
2. －Uvh：升级软件包--Update；
3. －qpl： 列出RPM软件包内的文件信息[Query Package list]；
4. －qpi：列出RPM软件包的描述信息[Query Package install package(s)]；
5. －qf：查找指定文件属于哪个RPM软件包[Query File]；
6. －Va：校验所有的 RPM软件包，查找丢失的文件[View Lost]；
7. －e：删除包
8. rpm -q samba //查询程序是否安装
9. rpm -ivh /media/cdrom/RedHat/RPMS/samba-3.0.10-1.4E.i386.rpm //按路径安装并显示进度
10. rpm -ivh --relocate /=/opt/gaim gaim-1.3.0-1.fc4.i386.rpm    //指定安装目录
11. rpm -ivh --test gaim-1.3.0-1.fc4.i386.rpm　　　 //用来检查依赖关系；并不是真正的安装；
12. rpm -Uvh --oldpackage gaim-1.3.0-1.fc4.i386.rpm //新版本降级为旧版本
13. rpm -qa | grep httpd　　　　　 ＃[搜索指定rpm包是否安装]--all搜索*httpd*
14. rpm -ql httpd　　　　　　　　　＃[搜索rpm包]--list所有文件安装目录
15. rpm -qpi Linux-1.4-6.i368.rpm　＃[查看rpm包]--query--package--install package信息
16. rpm -qpf Linux-1.4-6.i368.rpm　＃[查看rpm包]--file
17. rpm -qpR file.rpm　　　　　　　＃[查看包]依赖关系
18. rpm2cpio file.rpm |cpio -div    ＃[抽出文件]
19. rpm -ivh file.rpm 　＃[安装新的rpm]--install--verbose--hash
20. rpm -ivh http://mirrors.kernel.org/fedora/core/4/i386/os/Fedora/RPMS/gaim-1.3.0-1.fc4.i386.rpm
21. rpm -Uvh file.rpm    ＃[升级一个rpm]--upgrade
22. rpm -e file.rpm      ＃[删除一个rpm包]--erase
### 常用参数：
Install/Upgrade/Erase options:
-i, --install                     install package(s)
-v, --verbose                     provide more detailed output
-h, --hash                        print hash marks as package installs (good with -v)
-e, --erase                       erase (uninstall) package
-U, --upgrade=<packagefile>+      upgrade package(s)
－-replacepkge                    无论软件包是否已被安装，都强行安装软件包
--test                            安装测试，并不实际安装
--nodeps                          忽略软件包的依赖关系强行安装
--force                           忽略软件包及文件的冲突
Query options (with -q or --query):
-a, --all                         query/verify all packages
-p, --package                     query/verify a package file
-l, --list                        list files in package
-d, --docfiles                    list all documentation files
-f, --file                        query/verify package(s) owning file
RPM源代码包装安装
.src.rpm结尾的文件，这些文件是由软件的源代码包装而成的，用户要安装这类RPM软件包，必须使用命令：
rpm　--recompile　vim-4.6-4.src.rpm   ＃这个命令会把源代码解包并编译、安装它，如果用户使用命令：
rpm　--rebuild　vim-4.6-4.src.rpm　　＃在安装完成后，还会把编译生成的可执行文件重新包装成i386.rpm 的RPM软件包。
