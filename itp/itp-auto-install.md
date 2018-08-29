## 更新yum源
01. wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
02. yum clean all && yum makecache

## 安装中文字体
01. **yum -y install fontconfig**
02. 复制中文字体到 **/usr/share/fonts/chinese**
03. **chmod -R 755 /usr/share/fonts/chinese**
04. **vi /etc/fonts/fonts.conf** 在<dir>/usr/local/share/fonts</dir>行后添加**<dir>/usr/share/fonts/chinese</dir>**

## 安装JDK
01. vim /etc/profile
02. export JAVA_HOME=jdk1.8的路径
03. export PATH=$JAVA_HOME/bin:$PATH
04. source /etc/profile

## 安装Chrome
01. yum install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
02. vi /usr/bin/google-chrome
03. **补加黑色字体** exec -a "$0" "$HERE/chrome" "$@" **--no-sandbox --headless --disable-gpu**
04. yum install ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-utils xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc -y

## 安装chromedriver
01. 下载与chrome对应版本的chromedriver http://npm.taobao.org/mirrors/chromedriver/
02. 复制chromedriver到/apply/selenium/
03. chmod +x /apply/selenium/chromedriver

## 安装Selenium集群
01. **Install Master** cd /apply/selenium && nohup java -jar selenium-server-standalone-2.53.1.jar -role hub &
02. **Install Node** cd /apply/selenium && nohup java -jar selenium-server-standalone-2.53.1.jar -role node -hub http://masterIP:4444/grid/register &

## 部署bone-itp.jar应用

## Chrome命令行参数
01. --disable-accelerated-compositing 禁用加速
02. --disable-winsta 禁用渲染备用窗口
03. --disable-application-cache 禁用应用程序缓存
04. --disable-apps  禁用应用程序
05. --disable-audio    禁用音频
06. --disable-auth-negotiate-cname-lookup
07. --disable-background-networking  禁用后台联网
08. --disable-backing-store-limit    禁用存储数量限制，可以防止在打开大量的标签窗口时，页面出现闪烁的现象。
09. --disable-byte-range-support    禁用缓存的支持字节范围
10. --disable-click-to-play    禁用点击播放
11. --disable-connect-backup-jobs    如果超过指定的时间，则禁用建立备份的TCP连接
12. --disable-content-prefetch    禁用内容预取
13. --disable-custom-jumplist    禁用Windows 7的JumpList自定义功能
14. --disable-databases    禁用HTML5的数据库支持
15. --disable-desktop-notifications    禁用桌面通知（默认窗口启用）
16. --disable-dev-tools    禁用所有页面的渲染检测
17. --disable-device-orientation    禁用设备向导
18. --disable-webgl    禁用WebGL实验功能
19. --disable-extensions    禁用扩展
20. --disable-extensions-file-access-check    禁用扩展文件访问检查
21. --disable-geolocation    禁用地理位置的JavaScript API
22. --disable-glsl-translator    禁用GLSL翻译
23. --disable-hang-monitor    禁止任务管理器监视功能
24. --disable-internal-flash    禁用内部的Flash Player
25. --disable-ipv6    禁用IPv6
26. --disable-preconnect    禁用TCP/IP协议
27. --disable-javascript    禁用JS
28. --disable-java    禁用Java
29. --disable-local-storage     禁用本地存储
30. --disable-logging    禁用调试记录
31. --disable-new-tab-first-run  禁用新标签显示的通知
32. --disable-outdated-plugins    禁用过时的插件
33. --disable-plugins    禁止插件
34. --disable-popup-blocking    禁用阻止弹出窗口
35. --disable-prompt-on-repost
36. --disable-remote-fonts    禁用远程字体
37. --disable-renderer-accessibility    禁用渲染辅助功能
38. --disable-restore-background-contents    当浏览器重新启动后之前的网址被记录
39. --disable-session-storage    禁用会话存储
40. --disable-shared-workers    禁用共享，功能尚未完成
41. --disable-site-specific-quirks    禁用指定站点设置的WebKit兼容性问题。
42. --disable-speech-input    禁用语音输入
43. --disable-ssl-false-start    禁用SSL的虚假启动
44. --disable-sync    禁用同步
45. --disable-sync-apps    禁用同步应用程序
46. --disable-sync-autofill    禁用同步自动填表
47. --disable-sync-bookmarks    禁用同步书签
48. --disable-sync-extensions    禁用同步扩展
49. --disable-sync-passwords    禁用同步密码
50. --disable-sync-preferences    禁用同步偏好设置
51. --disable-sync-sessions    禁用同步会话
52. --disable-sync-themes    禁用同步主题（皮肤）
53. --disable-sync-typed-urls    禁用同步输入网址
54. --disable-tab-closeable-state-watcher    
55. --disable-translate    禁用翻译
56. --disable-web-resources    禁用网络资源后台加载服务
57. --disable-web-security    禁用网络安全提示?
58. --disable-web-sockets    禁用网络接口
59. --safebrowsing-disable-auto-update  禁用自动升级(安全浏览)
60. --disable-tls    禁用设置XMPP协议的客户端同步控制
61. --disable-flash-core-animation    禁用Flash核心动画
62. --disable-hole-punching    禁用Punching
63. --disable-seccomp-sandbox    禁用沙盒
64. --no-sandbox      启动无沙盒模式运行
65. --incognito ：进入隐身模式——保证浏览网页时，不留下任何痕迹。
66. --user-data-dir=“绝对路径”：指定UserData路径，默认路径位于系统盘，通过该命令，可以重定向为其它分区
67. --disk-cache-dir=”绝对路径“ ：指定Cache路径
68. --disk-cache-size= ：指定Cache大小，单位为字节
69. –first run ：强行指定浏览器会第一次运行
70. --disable-javascript：禁用Javascript
71. --omnibox-popup-count="数字" :指出多功能地址栏的弹出菜单数量
72. --user-agent="abcd"：强行执行http请求头中的UserAgent为abcd
73. --start-maximized：浏览器启动后，窗口默认为最大化
74. --single-process ：浏览器只能以单进程运行，通常用于调试，定位bug
75. --process-per-tab：一个标签一个进程
76. --process-per-site ：一个站点，一个进程
77. --in-process-plugins ：插件不以独立的进程运行，插件的异常崩溃，可能会导致整个页面挂掉
78. --proxy-pac-url ： 指定使用PAC代理时，所需要的脚本url地址
