## IO实时监控命令iostat详解

### iostat各个参数的说明
 `-c` 仅显示CPU统计信息.与-d选项互斥.
 `-d` 仅显示磁盘统计信息.与-c选项互斥.
 `-k` 以K为单位显示每秒的磁盘请求数,默认单位块.
 `-p device | ALL`
  与-x选项互斥,用于显示块设备及系统分区的统计信息.也可以在-p后指定一个设备名,如: # iostat -p hda
  或显示所有设备: # iostat -p ALL
 `-t`    在输出数据时,打印搜集数据的时间.
 `-V`    打印版本号和帮助信息.
 `-x`    输出扩展信息.
 
 ### 各个输出项的含义
avg-cpu段:
`%user:` 在用户级别运行所使用的CPU的百分比.
`%nice:` nice操作所使用的CPU的百分比.
`%sys:` 在系统级别(kernel)运行所使用CPU的百分比.
`%iowait:` CPU等待硬件I/O时,所占用CPU百分比.
`%idle:` CPU空闲时间的百分比.

Device段:
`tps:` 每秒钟发送到的I/O请求数.
`Blk_read /s:` 每秒读取的block数.
`Blk_wrtn/s:` 每秒写入的block数.
`Blk_read:`  读入的block总数.
`Blk_wrtn:`  写入的block总数.
