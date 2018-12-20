## 安装 openssl
1. ``wget http://mirrors.ibiblio.org/openssl/source/old/1.0.2/openssl-1.0.2.tar.gz`` 下载
2. ``tar -zvxf openssl-1.0.2.tar.gz``
3. ``cd openssl-1.0.2``
4. ``./config --prefix=/usr/local/openssl``
5. ``vi Makefile``将原来的：``CFLAG= -DOPENSSL_THREADS``修改为： ``CFLAG= -fPIC -DOPENSSL_THREADS``
6. ``make && make install``

## 安装erlang
1. 下载``otp_src_19.3.tar.gz``
2. ``tar -zxvf otp_src_19.3.tar.gz``
3. ``cd otp_src_19.3``
4. ``./configure --prefix=/opt/erlang``
5. 如果报``configure: error: No curses library functions found``，则``yum -y install ncurses-devel``
6. ``make && make install``
7. ``export ERLANG_HOME=/opt/erlang``
8. ``export PATH=$PATH:$ERLANG_HOME/bin``
9. ``erl`` 验证是否安装成功

## 安装RabbitMQ
1. 下载``rabbitmq-server-generic-unix-3.6.16.tar.xz``
2. ``tar -xvf rabbitmq-server-generic-unix-3.6.16.tar.xz -C /opt``
3. ``cd opt``
4. ``mv rabbitmq-server-3.6.16 rabbitmq``
5. ``export RABBITMQ_HOME=/opt/rabbitmq``
6. ``export PATH=$PATH:$RABBITMQ_HOME/sbin``
7. ``rabbitmq-server -detached`` 以守护进程运行
8. ``rabbitmqctl status`` 检查进程运行状态
