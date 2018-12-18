## CentOS 7修改系统语言为简体中文
1. ``locale`` 查看系当前语言包
2. ``locale -a`` 查看系统拥有语言包
3. ``yum install kde-l10n-Chinese`` 如果没有zh_CN.UTF-8，就安装简体中文语言包
4. ``vi /etc/locale.conf LANG=zh_CN.UTF-8`` 方法（一）
5. ``localectl set-locale LANG=zh_CN.UTF-8``
