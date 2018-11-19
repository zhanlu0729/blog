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
1. `eureka.server.enableSelfPreservation=false` 关闭自我保护
2. `eureka.instance.lease-renewal-interval-in-seconds` 表示 Eureka Client发送心跳给server端的频率
3. `eureka.instance.lease-expiration-duration-in-seconds` 表示 Eureka Server至上一次收到client的心跳之后，等待下一次心跳的超时时间，在这个时间内若没收到下一次心跳，则移除该Instance
4. 更多的Instance配置信息可参考源码中的配置类: org.springframework.cloud.netflix.eureka.EurekalnstanceConfigBean
5. 更多的 Server配置信息可参考源码中的配置类: org.springframework.cloud.netflix.eureka.server.EurekaServerConfigBean
6. `eureka.instance.metadataMap.xxx` 用户自定义元数据
