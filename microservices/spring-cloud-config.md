## Spring Cloud

### spring-cloud-hystrix-config
https://github.com/Netflix/Hystrix/tree/master/hystrix-contrib/hystrix-javanica#configuration

### Eureka Config
1. `eureka.server.enableSelfPreservation=false` 关闭自我保护
2. `eureka.instance.lease-renewal-interval-in-seconds` 表示 Eureka Client发送心跳给server端的频率
3. `eureka.instance.lease-expiration-duration-in-seconds` 表示 Eureka Server至上一次收到client的心跳之后，等待下一次心跳的超时时间，在这个时间内若没收到下一次心跳，则移除该Instance
4. 更多的Instance配置信息可参考源码中的配置类: org.springframework.cloud.netflix.eureka.EurekalnstanceConfigBean
5. 更多的 Server配置信息可参考源码中的配置类: org.springframework.cloud.netflix.eureka.server.EurekaServerConfigBean
6. `eureka.instance.metadataMap.xxx` 用户自定义元数据
