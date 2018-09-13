## ab - Apache HTTP服务器基准测试工具
ab是一个用于对Apache超文本传输​​协议（HTTP）服务器进行基准测试的工具。它旨在让您了解当前Apache安装的执行情况。这尤其向您展示了Apache安装能够提供的每秒请求数。

概要
ab [ -A auth-username:password ] [ -c concurrency ] [ -C cookie-name=value ] [ -d ] [ -e csv-file ] [ -g gnuplot-file ] [ -h ] [ -H custom-header ] [ -i ] [ -k ] [ -n requests ] [ -p POST-file ] [ -P proxy-auth-username:password ] [ -q ] [ -s ] [ -S ] [ -t timelimit ] [ -T content-type ] [ -v verbosity] [ -V ] [ -w ] [ -x <table>-attributes ] [ -X proxy[:port] ] [ -y <tr>-attributes ] [ -z <td>-attributes ] [http://]hostname[:port]/path

最佳
选项
-A auth-username:password
为服务器提供BASIC身份验证凭据。用户名和密码由一个单独分隔，:并通过wire base64编码发送。无论服务器是否需要它，都会发送该字符串（即，已发送401认证）。
-c concurrency
一次执行多个请求的数量。默认值是一次一个请求。
-C cookie-name=value
Cookie:在请求中添加一行。论证通常是一 对的形式。该字段是可重复的。name=value
-d
不显示“XX [ms]表中提供的百分比”。（遗产支持）。
-e csv-file
写一个逗号分隔值（CSV）文件，其中包含为每个百分比（从1％到100％）提供服务该百分比请求所用的时间（以毫秒为单位）。这通常比'gnuplot'文件更有用; 因为结果已经“装箱”了。
-g gnuplot-file
将所有测量值写为'gnuplot'或TSV（Tab单独值）文件。这个文件可以很容易地导入到Gnuplot，IDL，Mathematica，Igor甚至Excel等软件包中。标签位于文件的第一行。
-h
显示使用信息。
-H custom-header
在请求中附加额外的标头。该参数是典型地在一个有效报头线的形式，含有一个冒号分隔的字段值对（即，"Accept-Encoding: zip/zop;8bit"）。
-i
做HEAD请求而不是GET。
-k
启用HTTP KeepAlive功能，即在一个HTTP会话中执行多个请求。默认值是没有KeepAlive。
-n requests
为基准测试会话执行的请求数。默认情况下只执行单个请求，这通常会导致非代表性的基准测试结果。
-p POST-file
包含POST数据的文件。
-P proxy-auth-username:password
将BASIC身份验证凭据提供给代理路由。用户名和密码由一个单独分隔，:并通过wire base64编码发送。无论代理是否需要它，都会发送该字符串（即，已发送407代理身份验证）。
-q
处理超过150个请求时，每10％或100个请求左右ab输出进度计数stderr。该 -q标志将禁止这些消息。
-s
编译时（ab -h将显示）使用SSL保护https而不是http协议。此功能是实验性的，非常简陋。你可能不想使用它。
-S
当平均值和中位数分别超过标准差的一倍或两倍时，不显示中值和标准差值，也不显示警告/错误消息。默认为min / avg / max值。（遗产支持）。
-t timelimit
用于基准测试的最大秒数。这意味着 -n 50000内部。使用此选项可在固定的总时间内对服务器进行基准测试。默认情况下没有时间限制。
-T content-type
用于POST数据的内容类型标头。
-v verbosity
设置详细级别 - 4以及上面打印标题信息，3上面打印响应代码（404,200等）， 2以及上面打印警告和信息。
-V
显示版本号并退出。
-w
在HTML表格中打印结果。默认表格为两列宽，背景为白色。
-x <table>-attributes
用作...的属性的字符串<table>。插入属性。<table here >
-X proxy[:port]
使用代理服务器来处理请求。
-y <tr>-attributes
用作...的属性的字符串<tr>。
-z <td>-attributes
用作...的属性的字符串<td>。
最佳
错误
有各种静态声明的固定长度的缓冲区。结合对命令行参数的延迟解析，来自服务器和其他外部输入的响应头，这可能会让你感到困惑。

它没有完全实现HTTP / 1.x; 只接受一些“预期”的回复形式。相当大量的使用strstr(3)显示在配置文件中，这可能表明性能问题; 也就是说，你会测量ab性能而不是服务器的性能。
