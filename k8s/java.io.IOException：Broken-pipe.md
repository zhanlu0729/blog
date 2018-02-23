今天公司技术支持的童鞋报告一个客户的服务不工作了，紧急求助，于是远程登陆上服务器排查问题。

    查看采集数据的tomcat日志，习惯性的先翻到日志的最后去查看有没有异常的打印，果然发现了好几种异常信息，但是最多还是这个：

[java] view plain copy
24-Nov-2016 09:54:21.116 SEVERE [http-nio-8081-Acceptor-0] org.apache.tomcat.util.net.NioEndpoint$Acceptor.run Socket accept failed  
 java.io.IOException: Too many open files  
    at sun.nio.ch.ServerSocketChannelImpl.accept0(Native Method)  
    at sun.nio.ch.ServerSocketChannelImpl.accept(ServerSocketChannelImpl.java:241)  
    at org.apache.tomcat.util.net.NioEndpoint$Acceptor.run(NioEndpoint.java:688)  
    at java.lang.Thread.run(Thread.java:745)  
    “Too manay open files” 问题很明显啊，文件描述符超出限制导致无法打开文件或创建网络连接，这个问题又会导致一些其它问题的产生，肯定是ulimit没有优化,于是检查ulimit的设置；

[plain] view plain copy
[root@sdfassd logs]# ulimit -a  
core file size          (blocks, -c) 0  
data seg size           (kbytes, -d) unlimited  
scheduling priority             (-e) 0  
file size               (blocks, -f) unlimited  
pending signals                 (-i) 62819  
max locked memory       (kbytes, -l) 64  
max memory size         (kbytes, -m) unlimited  
open files                      (-n) 65535  
pipe size            (512 bytes, -p) 8  
POSIX message queues     (bytes, -q) 819200  
real-time priority              (-r) 0  
stack size              (kbytes, -s) 10240  
cpu time               (seconds, -t) unlimited  
max user processes              (-u) 62819  
virtual memory          (kbytes, -v) unlimited  
file locks                      (-x) unlimited  

     open files竟然是65535，已经做过了优化，是不是先启动的tomcat等服务，然后才对ulimit做的优化？有可能，这样的话重启一下服务就ok了，于是将全部服务重启了一遍，运行正常了，不一会报表就显示数据了，然后告诉技术支持，问题已经解决了，然后就去处理别的case了；

    结果还不到20分钟，技术支持说，报表又没有数据了，于是又打数据采集的应用的tomcat日志查看，发现了一堆异常，全都是一个错：

[java] view plain copy
24-Nov-2016 09:54:24.574 WARNING [http-nio-18088-exec-699] org.apache.catalina.core.StandardHostValve.throwable Exception Processing ErrorPage[exceptionType=java.lang.Throwable, location=/views/error/500.jsp]  
 org.apache.catalina.connector.ClientAbortException: java.io.IOException: Broken pipe  
    at org.apache.catalina.connector.OutputBuffer.realWriteBytes(OutputBuffer.java:393)  
    at org.apache.tomcat.util.buf.ByteChunk.flushBuffer(ByteChunk.java:426)  
    at org.apache.catalina.connector.OutputBuffer.doFlush(OutputBuffer.java:342)  
    at org.apache.catalina.connector.OutputBuffer.close(OutputBuffer.java:295)  
    at org.apache.catalina.connector.Response.finishResponse(Response.java:453)  
    at org.apache.catalina.core.StandardHostValve.throwable(StandardHostValve.java:378)  
    at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:174)  
    at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:79)  
    at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:610)  
    at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:610)  
    at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:88)  
    at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:537)  
    at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1085)  
    at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:658)  
    at org.apache.coyote.http11.Http11NioProtocol$Http11ConnectionHandler.process(Http11NioProtocol.java:222)  
    at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1556)  
    at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.run(NioEndpoint.java:1513)  
    at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)  
    at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)  
    at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)  
    at java.lang.Thread.run(Thread.java:745)  

    这个异常非常多，看报错信息，是tomcat的connector在执行写操作的时候发生了Broken pipe异常，connector是tomcat处理网络请求的，难道是网络出问题了，但是为什么发生异常的都是写，读就没问题呢？为了判断是不是网络问题，于是用wget命令在本地访问了一下服务器的一个接口，结果发现等了好久都没有响应，正常情况下应该是马上就有响应的，这说明不是网络的原因，是服务器的问题，又用命令查看了下当前tcpip连接的状态：
[plain] view plain copy
[root@sdfassd logs]# netstat -n | awk '/^tcp/ {++state[$NF]} END {for(key in state) print key,"\t",state[key]}'  
CLOSE_WAIT        3853  
TIME_WAIT         40  
ESTABLISHED       285  
LAST_ACT          6  

    CLOSE_WAIT 状态的连接竟然有3853个，这太不正常了，这说明是客户端先关闭了连接，服务器端没有执行关闭连接的操作，导致服务器端一直维持在CLOSE_WAIT的状态，如果不对操作系统的keepalive做优化，这个状态默认会维持两个小时，查看了下系统的设置：
[plain] view plain copy
[root@sdfassd logs]# sysctl -a |grep keepalive  
net.ipv4.tcp_keepalive_time = 7200  
net.ipv4.tcp_keepalive_probes = 9  
net.ipv4.tcp_keepalive_intvl = 75  
    果然是7200秒，这就解释通了，为什么第一次查看tomcat日志最后报错都是“Too manay open files”异常，一定是在两个小时内，close_wait状态暴增，导致文件描述符超过了65535的最大限制；
    而这个状态应该就是broken pipe 异常导致的，是什么导致的broken pipe异常呢？为什么探针关闭了连接，但是数据采集服务器却没有关闭连接？报异常的是tomcat的connector，tomcat不可能会忘记调用close方法去关闭连接，排除了程序的问题，也想不出来是什么导致的了；

    于是去拿了往采集服务器上传数据的探针的日志查看，竟然有大量的一个异常：

[plain] view plain copy
2016-11-24 16:27:36,217 [TingYun Harvest Service 1] 166 WARN  - Error occurred sending metric data to TingYun. There can be intermittent connection failures. Please wait for a short period of time: java.net.SocketTimeoutException: Read timed out  
java.net.SocketTimeoutException: Read timed out  
    at java.net.SocketInputStream.socketRead0(Native Method) ~[na:1.7.0_60]  
    at java.net.SocketInputStream.read(SocketInputStream.java:152) ~[na:1.7.0_60]  
    at java.net.SocketInputStream.read(SocketInputStream.java:122) ~[na:1.7.0_60]  
    at com.tingyun.agent.libs.org.apache.http.impl.io.SessionInputBufferImpl.streamRead(SourceFile:136) ~[tingyun-agent-java.jar:2.1.3]  
        .................  
    都是read time out异常,那么问题就明确了，  是探针端读取超时了，断开了连接，而这时候数据采集服务器还在处理请求，它并不知道探针端已经断开了连接，处理完请求后再将处理结果发给探针，就broken pipe了；
    原来这个异常是客户端读取超时关闭了连接,这时候服务器端再向客户端已经断开的连接写数据时就发生了broken pipe异常！



    探针读超时的时间是2分钟，服务器为什么这么长的时间都没有响应呢？于是使用jstack命令导出了tomcat的线程栈信息进行分析，最后发现代码中有耗时的操作加了锁，导致线程阻塞（保密原因，在这里就不贴代码了）；

 

这里总结一下，给我发私信的有些朋友没有get到Broken piple问题的重点，并不是只有超时才会导致这个问题，只要是连接断开，再往这个断开的连接上去执行写操作，都会出现这个异常，客户端超时断开只是其中的一种情况：

另外，当看到“Too manay open files”异常的时候，通常做法除了检查ulimit系统限制外，还应该看一下进程打开的文件句柄数lsof -n 命令看一下系统和当前应用打开的文件句柄数，这里还好忽略了这一步，否则可能又要花费一些时间来查找系统真正的问题；

通过这个案例可知，排查问题时，在有些情况下，你第一眼看到的异常信息未必就是问题的根源所在，而是后续一些连锁反应，尤其是当大量出现同一个异常的情况下，不要看最后一条异常日志，应该先去日志里面查找第一出现该异常的位置，看看这个异常发生之前系统的状况；
