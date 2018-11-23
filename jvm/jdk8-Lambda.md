## JDK8 Stream
1. ``of`` 使用一组初始值生成新的Stream
2. ``collect(toList())`` 由Stream里面的值生成一个列表，是一个及早求值操作
3. ``map`` 接受一个函数作为参数(Function)，将一个流中的值转换成一个新的流，参数和返回值不必属性同一种类型
4. ``filter`` 接受一个函数作为参数(Predicate)，遍历数据并检查其中的元素时，返回true的元素将会被保留下来



Function 接口是一个只包含一个参数的普通函数接口：``T --> R``
Predicate 接口是一个只包含一个参数的普通函数接口：``T --> boolean``
