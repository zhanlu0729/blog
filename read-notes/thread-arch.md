### wait和sleep
1. ``wait``和``sleep``都可以使线程进入阻塞方法
2. ``wait``和``sleep``均是可中断方法，被中断后都会收到中断异常
3. ``wait``是``Object``的方法，而``sleep``是``Thread``特有的方法
4. ``wait``方法的执行必须在同步方法中进行，而``sleep``则不需要
5. 线程在同步方法中执行``sleep``方法时，并不会释放``monitor``锁，而wait方法则会释放``monitor``锁，二者均会释放CPU
