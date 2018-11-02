## Spring学习笔记
### Spring中bean的生命周期
1. **Bean的建立** 由BeanFactory读取Bean定义文件并实例化
2. **Setter注入** 执行Bean的属性依赖注入，Spring按照Bean定义信息配置Bean所有属性
3. **BeanNameAware的setBeanName()** 如果Bean类实现了`org.springframework.beans.factory.BeanNameAware`接口，则执行其`setBeanName()`方法
4. **BeanFactoryAware的setBeanFactory()** 如果Bean类实现了`org.springframework.beans.factory.BeanFactoryAware`接口，则执行其`setBeanFactory()`方法
5. **BeanPostProcessors的processBeforeInitialization()** 容器中如果有实现`org.springframework.beans.factory.BeanPostProcessors`接口的实例，则任何Bean在初始化之前都会执行这个实例的`processBeforeInitialization()`方法
6. **InitializingBean的afterPropertiesSet()** 如果Bean类实现了`org.springframework.beans.factory.InitializingBean`接口，则执行其afterPropertiesSet()方法
7. **Bean定义文件中定义init-method** 在Bean定义文件中使用`init-method`属性设定方法名称，这时会执行initMethod()方法，注意，这个方法是不带参数的
8. **@PostConstruct** 如果在Bean中使用`@PostConstruct`定义方法，这时会执行`@PostConstruct`方法，注意，这个方法是不带参数的
9. **BeanPostProcessors的processAfterInitialization()** 容器中如果有实现`org.springframework.beans.factory.BeanPostProcessors`接口的实例，则任何Bean在初始化之前都会执行这个实例的`processAfterInitialization()`方法
10. **DisposableBean的destroy()** 在容器关闭时，如果Bean类实现了`org.springframework.beans.factory.DisposableBean`接口，则执行它的`destroy()`方法
11. **Bean定义文件中定义destroy-method** 在容器关闭时，可以在Bean定义文件中使用`destory-method`定义的方法，这时会执行destroyMethod()方法，注意，这个方法是不带参数的
12. **@PreDestroy** 如果在Bean中使用`@PreDestroy`定义方法，这时会执行`@PreDestroy`方法，注意，这个方法是不带参数的
13. 处理业务逻辑
14.  如果使用ApplicationContext来维护一个Bean的生命周期，则基本上与上边的流程相同，只不过在执行BeanNameAware的setBeanName()后，若有Bean类实现了org.springframework.context.ApplicationContextAware接口，则执行其setApplicationContext()方法，然后再进行BeanPostProcessors的processBeforeInitialization()，实际上，ApplicationContext除了向BeanFactory那样维护容器外，还提供了更加丰富的框架功能，如Bean的消息，事件处理机制等
