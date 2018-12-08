## 安装erlang
1. 下载``otp_src_19.3.tar.gz``
2. ``tar -zxvf otp_src_19.3.tar.gz``
3. cd otp_src_19.3
4. ``./configure --prefix=/opt/erlang``
5. 如果报``configure: error: No curses library functions found``，则``yum install ncurses-level``
6. ``make && make install``
