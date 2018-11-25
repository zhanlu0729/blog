## Spring Cloud

### Spring Cloud/Spring Boot版本兼容性
1. Angel版本基于``Spring Boot v1.2.x``构建，在一些场景下与``SpringBoot1.3.x``及以上版本不兼容
2. Brixton版本基于``Spring Boot v1.3.x``构建，也可使用``1.4.x``进行测试，与``SpringBoot 1.2.x``不兼容
3. Camden版本基于``Spring Boot v1.4.x``构建，也可使用``1.5.x``进行测试
4. Dalston版本基于``Spring Boot v1.5.x``构建,不兼容``SpringBoot v2.0.x``
5. Edgware版本基于``Spring Boot v1.5.x``构建,不兼容``SpringBoot v2.0.x``
6. Finchley版本基于``Spring Boot v2.0.x``构建,不兼容``SpringBoot v1.x``

###  Spring Cloud Eureka概念
1. ``AvailabilityZone`` 理解成机房
2. ``Region`` 理解为跨机房的Eureka集群
3. ``Application Service`` 相当于服务提供者
4. ``Application Client`` 相当于服务消费者
5. ``Make Remote Call`` 可以理解成调用RESTful API的行为
6. ``Eureka Server`` 提供服务发现的能力，各个微服务启动时，会向Eureka Server注册自己的信息(例如IP、端口、微服务名称等)
7. ``Eureka Client`` 是一个Java客户端，用于简化与EurekaServer的交互，微服务上报心跳周期默认``30``秒，注销无心跳微服务默认``90``秒
8. 

### spring-cloud-hystrix-config
https://github.com/Netflix/Hystrix/tree/master/hystrix-contrib/hystrix-javanica#configuration

### Eureka Config
1. ``eureka.client.registerWithEureka`` 表示是否将自己注册到Eureka Server，默认为``true``。 如果当前应用就是EurekaServer，可设为``false``
2. ``eureka.client.fetchRegistry`` 表示是否从Eureka Server获取注册信息，默认为``true``。一个单点的EurekaServer，不需要同步其他的 EurekaServer节点的数据，可设为``false``
3. ``eureka.client.serviceUrl.defaultZone`` 设置与EurekaServer交互的地址，查询服务和注册服务都需要依赖这个地址。默认是 ``http://localhost:8761/eureka``，多个地址间可使用``逗号``分隔
4. ``eureka.instance.prefer-ip-address`` ``true``表示将自己的IP注册到Eureka Server。若不配置该属性或将其设置为``false``，则表示注册微服务所在操作系统的``hostname``到Eureka Server，``eureka.instance.ip-address:127.0.0.1``手动指定IP地址
5. 若不想将服务注册到EurekaServer，只需设置``spring.cloud.service-registry.auto-registration.enabled=false``或 ``@EnableDiscoveryClient(autoRegister=false)``即可
6. ``eureka.server.enableSelfPreservation=false`` 关闭自我保护
7. ``eureka.instance.lease-renewal-interval-in-seconds`` 表示Eureka Client发送心跳给server端的频率
8. ``eureka.instance.lease-expiration-duration-in-seconds`` 表示Eureka Server至上一次收到client的心跳之后，等待下一次心跳的超时时间，在这个时间内若没收到下一次心跳，则移除该Instance
9. 更多的Instance配置信息可参考源码中的配置类: ``org.springframework.cloud.netflix.eureka.EurekalnstanceConfigBean``
10. 更多的 Server配置信息可参考源码中的配置类: ``org.springframework.cloud.netflix.eureka.server.EurekaServerConfigBean``
11. `eureka.instance.metadataMap.{xx:xx,yy:yy}` 用户自定义元数据
12. ``spring.cloud.inetutils.ignored-interfaces: [docker0, veth.*]`` 多网卡环境下的 IP选择,如忽略``dockerO``网卡以及所有以``veth``开头的网卡
13. ``spring.cloud.inetutils.preferredNetworks: [192.168, 10.0]`` 使用正则表达式，指定使用的网络地址
14. ``spring.cloud.inetutils.useOnlySiteLocalInterfaces: true`` 只使用站点本地地址
15. ``eureka.instance.virtual-host-name或者eureka.instance.secure-virtual-host-name指`` 指定虚拟主机名,在默认情况下，虚拟主机名和服务名称是一致的.虚拟主机名不能包含“一”之类的字符，否则Ribbon在调用时会报异常
16. ``serviceName.ribbon.listOfServers=ip1:port1,ip2:port2...`` 脱离Eureka使用Ribbon的负载均衡功能
17. ``ribbon.eu「eka.enabled=false`` 当EurekaClient依赖在项目的classpath下时，如果想单独使用Ribbon，而不使用Eurkea的服务发现功能
18. 饥饿加载
```
ribbon:
  eager-load:
    enable: true
    clients: client1,client2
```
16. 属性配置的方式比如a代码配置的方式优先级更高

### 开启基于HTTP basic的认证
1. ``security.basic.enabled: true`` 开启基于HTTP basic的认证
2. ``security.user.name:xxx`` 配直登录的账号
3. ``security.user.password:xxx`` 配直登录的密码
