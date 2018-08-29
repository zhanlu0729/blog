## 更新yum源
01. wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
02. yum clean all && yum makecache

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
01. **Install Master** nohup java -jar selenium-server-standalone-2.53.1.jar -role hub &
02. **Install Node** nohup java -jar selenium-server-standalone-2.53.1.jar -role node -hub http://masterIP:4444/grid/register &

## 部署bone-itp.jar应用

## Chrome命令行参数
01. disable-accelerated-compositing 禁用加速
02. disable-winsta 禁用渲染备用窗口
03. disable-application-cache 禁用应用程序缓存
04. disable-apps  禁用应用程序
05. disable-audio    禁用音频
06. disable-auth-negotiate-cname-lookup
07. disable-background-networking  禁用后台联网
08. disable-backing-store-limit    禁用存储数量限制，可以防止在打开大量的标签窗口时，页面出现闪烁的现象。
09. disable-byte-range-support    禁用缓存的支持字节范围
10. disable-click-to-play    禁用点击播放
11. disable-connect-backup-jobs    如果超过指定的时间，则禁用建立备份的TCP连接
12. disable-content-prefetch    禁用内容预取
13. disable-custom-jumplist    禁用Windows 7的JumpList自定义功能
14. disable-databases    禁用HTML5的数据库支持
15. disable-desktop-notifications    禁用桌面通知（默认窗口启用）
16. disable-dev-tools    禁用所有页面的渲染检测
17. disable-device-orientation    禁用设备向导
18. disable-webgl    禁用WebGL实验功能
19. disable-extensions    禁用扩展
20. disable-extensions-file-access-check    禁用扩展文件访问检查
21. disable-geolocation    禁用地理位置的JavaScript API
disable-glsl-translator    禁用GLSL翻译
disable-hang-monitor    禁止任务管理器监视功能
disable-internal-flash    禁用内部的Flash Player
disable-ipv6    禁用IPv6
disable-preconnect    禁用TCP/IP协议
disable-javascript    禁用JS
disable-java    禁用Java
disable-local-storage     禁用本地存储
disable-logging    禁用调试记录
disable-new-tab-first-run  禁用新标签显示的通知
disable-outdated-plugins    禁用过时的插件
disable-plugins    禁止插件
disable-popup-blocking    禁用阻止弹出窗口
disable-prompt-on-repost
disable-remote-fonts    禁用远程字体
disable-renderer-accessibility    禁用渲染辅助功能
disable-restore-background-contents    当浏览器重新启动后之前的网址被记录
disable-session-storage    禁用会话存储
disable-shared-workers    禁用共享，功能尚未完成
disable-site-specific-quirks    禁用指定站点设置的WebKit兼容性问题。
disable-speech-input    禁用语音输入
disable-ssl-false-start    禁用SSL的虚假启动
disable-sync    禁用同步
disable-sync-apps    禁用同步应用程序
disable-sync-autofill    禁用同步自动填表
disable-sync-bookmarks    禁用同步书签
disable-sync-extensions    禁用同步扩展
disable-sync-passwords    禁用同步密码
disable-sync-preferences    禁用同步偏好设置
disable-sync-sessions    禁用同步会话
disable-sync-themes    禁用同步主题（皮肤）
disable-sync-typed-urls    禁用同步输入网址
disable-tab-closeable-state-watcher    
disable-translate    禁用翻译
disable-web-resources    禁用网络资源后台加载服务
disable-web-security    禁用网络安全提示?
disable-web-sockets    禁用网络接口
safebrowsing-disable-auto-update  禁用自动升级(安全浏览)
disable-tls    禁用设置XMPP协议的客户端同步控制
disable-flash-core-animation    禁用Flash核心动画
disable-hole-punching    禁用Punching
disable-seccomp-sandbox    禁用沙盒
no-sandbox      启动无沙盒模式运行
