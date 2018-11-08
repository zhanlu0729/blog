### wait和sleep
1. ``wait()``和``sleep()``都可以使线程进入阻塞方法
2. ``wait()``和``sleep()``均是可中断方法，被中断后都会收到中断异常
3. ``wait()``是``Object``的方法，而``sleep()``是``Thread``特有的方法
4. ``wait``方法的执行必须在同步方法中进行，而``sleep()``则不需要
5. 线程在同步方法中执行``sleep()``方法时，并不会释放``monitor``锁，而wait方法则会释放``monitor``锁，二者均会释放CPU
6. ``sleep()``短暂休眠之后则会主动退出阻塞，而``wait``方法(没有指定``wait``时间)则需要被其他线程中断后才能退出阻塞
7. 线程调用``wait()``方法后都被加入与该对象``monitor``关联的``wait set``中，并且释放``monitor``所有权；待另外一个线程调用该``monitor``的``notify()``方法之后，其中一个线程从``wait set``弹出，而调用``notifyAll()``方法则所有线程都会被弹出

### notify和notifyAll
1. ``notify()``方法和``notifyAll()``方法都可以唤醒因调用``wait()``方法而阻塞的线程
2. ``notify()``方法只能唤醒其中一个纯种，而``notifyAll()``方法则可以同时唤醒全部阻塞的线程，同样被唤醒的线程仍需要争抢``monitor``锁
