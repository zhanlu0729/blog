## JDK8 Stream
1. ``of`` 使用一组初始值生成新的Stream
2. ``collect(toList())`` 由Stream里面的值生成一个列表，是一个及早求值操作
3. ``map`` 接受一个函数作为参数(Function)，将一个流中的值转换成一个新的流，参数和返回值不必属性同一种类型
4. ``filter`` 接受一个函数作为参数(Predicate)，遍历数据并检查其中的元素时，返回true的元素将会被保留下来
5. ``flatMap`` 可用Stream替换值，将多个Stream连接成一个Stream
6. ``min`` 求Stream中的最小值
7. ``max`` 求Stream中的最大值
8. ``reduce`` 可以实现从一组值生成一个值

15. ``Function`` 接口是一个只包含一个参数的普通函数接口：``T --> R``
16. ``Predicate`` 接口是一个只包含一个参数的普通函数接口：``T --> boolean``
17. ``高阶函数``是指接受另外一个函数作为参数或返回一个函数的函数
