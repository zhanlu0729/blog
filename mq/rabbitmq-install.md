## 安装erlang
1. 下载``otp_src_19.3.tar.gz``
2. ``tar -zxvf otp_src_19.3.tar.gz``
3. ``cd otp_src_19.3``
4. ``./configure --prefix=/opt/erlang``
5. 如果报``configure: error: No curses library functions found``，则``yum -y install ncurses-level``
6. ``make && make install``
7. ``export ERLANG_HOME=/opt/erlang``
8. ``export PATH=$PATH:$ERLANG_HOME/bin``
9. ``erl`` 验证是否安装成功
