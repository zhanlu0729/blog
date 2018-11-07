### wait和sleep
1. ``wait``和``sleep``都可以使线程进入阻塞方法
2. ``wait``和``sleep``均是可中断方法，被中断后都会收到中断异常
3. ``wait``是``Object``的方法，而``sleep``是``Thread``特有的方法
4. ``wait``方法的执行必须在同步方法中进行，而``sleep``则不需要
5. 线程在同步方法中执行``sleep``方法时，并不会释放``monitor``锁，而wait方法则会释放``monitor``锁，二者均会释放CPU
6. ``sleep``短暂休眠之后则会主动退出阻塞，而``wait``方法(没有指定``wait``时间)则需要被其他线程中断后才能退出阻塞

### notify和notifyAll
1. ``notify方法``和``notifyAll方法``都可以唤醒因调用``wait``方法而阻塞的线程
2. ``notify方法``只能唤醒其中一个纯种，而``notifyAll方法``则可以同时唤醒全部阻塞的线程，同样被唤醒的线程仍需要争抢``monitor``锁
