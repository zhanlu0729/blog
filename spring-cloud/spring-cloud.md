## Spring Cloud

### Spring Cloud/Spring Boot版本兼容性
1. Angel版本基于``SpringBoot-v1.2.x``构建，在一些场景下与``SpringBoot1.3.x``及以上版本不兼容
2. Brixton版本基于``SpringBoot-v1.3.x``构建，也可使用``1.4.x``进行测试，与``SpringBoot 1.2.x``不兼容
3. Camden版本基于``SpringBoot-v1.4.x``构建，也可使用``1.5.x``进行测试
4. Dalston版本基于``SpringBoot-v1.5.x``构建,不兼容``SpringBoot 2.0.x``
5. Edgware版本基于``SpringBoot-v1.5.x``构建,不兼容``SpringBoot 2.0.x``
6. Finchley版本基于``SpringBoot-v2.0.x``构建,不兼容``SpringBoot l.x``

### spring-cloud-hystrix-config
https://github.com/Netflix/Hystrix/tree/master/hystrix-contrib/hystrix-javanica#configuration

### Eureka Config
1. `eureka.server.enableSelfPreservation=false` 关闭自我保护
2. `eureka.instance.lease-renewal-interval-in-seconds` 表示 Eureka Client发送心跳给server端的频率
3. `eureka.instance.lease-expiration-duration-in-seconds` 表示 Eureka Server至上一次收到client的心跳之后，等待下一次心跳的超时时间，在这个时间内若没收到下一次心跳，则移除该Instance
4. 更多的Instance配置信息可参考源码中的配置类: org.springframework.cloud.netflix.eureka.EurekalnstanceConfigBean
5. 更多的 Server配置信息可参考源码中的配置类: org.springframework.cloud.netflix.eureka.server.EurekaServerConfigBean
6. `eureka.instance.metadataMap.xxx` 用户自定义元数据
