## 安装JDK
01. vim /etc/profile
02. export JAVA_HOME=jdk1.8的路径
03. export PATH=$JAVA_HOME/bin:$PATH

## 更新yum源
01. wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
02. yum clean all && yum makecache

## 安装Chrome
01. yum install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
02. vi /usr/bin/google-chrome
03. exec -a "$0" "$HERE/chrome" "$@" **--no-sandbox --headless**

## ChromeDriver
01. download与chrome兼容的chromedriver http://npm.taobao.org/mirrors/chromedriver/
02. 将下载好的chromedriver复制到 /apply/selenium/
03. chmod +x /apply/selenium/chromedriver

## 安装Xorg
01. yum install ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-utils xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc -y
