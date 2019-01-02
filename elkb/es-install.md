##
1. 调大文件句柄：vim /etc/security/limits.conf
```
# End of file
* soft noproc 102400
* hard noproc 201400
* soft nofile 102400
* hard nofile 102400
```
