### Vue生命周期钩子
1. **created** 实例创建完成后调用，此阶段完成了数据的观测等,但尚未挂载；`$el`还不可用，需要初始化处理一些数据时会比较有用．
2. **mounted** `el`挂载到实例上后调用，一般我们的第一个业务逻辑会在这里开始
3. **beforeDestroy** 实例销毁之前调用，主要解绑一些使用`addEventListener`监听的事件等
4. **computed** 所有的计算属性都以函数的形式写在Vue实例内的`computed`选项内，最终返回计算后的结果

### Vue指令与事件
指令的主要职责就是当其表达式的值改变时，相应地将某些行为应用到DOM上
1. **v-if** 当数据值为true时，元素会被插入，为false时则会被移除
2. **v-bind** 基本用途是动态更新HTML元素上的属性
3. **v-on** 用来绑定事件监听器，可以做些交互
4. **@click.stop** 阻止单击事件冒泡
5. **@submit.prevent** 提交事件不再重载页面
6. **@click.stop.prevent** 一修饰符可以串
7. **@submit.prevent** 只有修饰符
8. **@click.capture** 一添加事件侦听器时使用事件捕获模式
9. **@click.self** 只当事件在该元素本身（而不是子元素）触发时触发回调
10. **@click.once** 只触发 次，组件同样适用
11. **@keyup.num** 只有在keyCode=num时调用事件
