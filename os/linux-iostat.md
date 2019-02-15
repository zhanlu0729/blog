## iostat IO实时监控 [yum install sysstat]
### iostat [-c|-d] [-k|-m] [-t] [间隔秒数] [侦测次数]
1. `iostat`各个参数的说明
- `-c` 仅显示`CPU`统计信息.与`-d`选项互斥
- `-d` 仅显示磁盘统计信息.与`-c`选项互斥
- `-k` 以K为单位显示每秒的磁盘请求数,默认单位块
- `-p device | ALL` 与`-x`选项互斥,用于显示块设备及系统分区的统计信息.也可以在-p后指定一个设备名,如: #iostat -p hda或显示所有设备: #iostat -p ALL
- `-t` 在输出数据时,打印搜集数据的时间
- `-V` 打印版本号和帮助信息
- `-x` 输出扩展信息
2. `avg-cpu`段:
- `%user` 在用户级别运行所使用的CPU的百分比
- `%nice` nice操作所使用的CPU的百分比
- `%sys` 在系统级别(kernel)运行所使用CPU的百分比
- `%iowait` CPU等待硬件I/O时,所占用CPU百分比
- `%idle` CPU空闲时间的百分比
3. `Device`段:
- `tps` 每秒钟发送到的I/O请求数
- `Blk_read/s` 每秒读取的block数
- `Blk_wrtn/s` 每秒写入的block数
- `Blk_read`  读入的block总数
- `Blk_wrtn`  写入的block总数

### 入门使用
1. `tps`该设备每秒的传输次数（Indicate the number of transfers per second that were issued to the device.）。"一次传输"意思是"一次I/O请求"。多个逻辑请求可能会被合并为"一次I/O请求"。"一次传输"请求的大小是未知的。
2. `kB_read/s` 每秒从设备（drive expressed）读取的数据量；
3. `kB_wrtn/s` 每秒向设备（drive expressed）写入的数据量；
4. `kB_read` 读取的总数据量；
5. `kB_wrtn` 写入的总数量数据量；这些单位都为Kilobytes。
