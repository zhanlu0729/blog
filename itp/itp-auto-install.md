1. ** 更新yum源 ** wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all && yum makecache
2. ** 安装Chrome ** yum install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

3. ** 安装Xorg ** "yum install  \
 ipa-gothic-fonts \
 xorg-x11-fonts-100dpi \
 xorg-x11-fonts-75dpi \
 xorg-x11-utils \
 xorg-x11-fonts-cyrillic \
 xorg-x11-fonts-Type1 \
 xorg-x11-fonts-misc -y"
