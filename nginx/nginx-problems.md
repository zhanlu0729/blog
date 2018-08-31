## 启停问题
01. **nginx: [error] open() "/usr/local/var/run/nginx.pid" failed (2: No such file or directory)** 解决方法：找到你的nginx.conf的文件夹目录，然后运行这个 
nginx -c /usr/local/etc/nginx/nginx.conf命令， 
再运行nginx -s reload，就可以了
