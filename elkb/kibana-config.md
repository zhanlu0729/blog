## 配置Kibana 编辑
Kibana服务器kibana.yml在启动时从文件中读取属性。此文件的位置根据您安装Kibana的方式而有所不同。例如，如果您从存档分发（.tar.gz或.zip）安装Kibana，则默认情况下它位于$KIBANA_HOME/config。默认情况下，使用软件包分发（Debian或RPM），它是在/etc/kibana。

默认设置配置Kibana运行localhost:5601。要更改主机或端口号，或连接到在其他计算机上运行的Elasticsearch，您需要更新kibana.yml文件。您还可以启用SSL并设置各种其他选项。最后，可以使用${MY_ENV_VAR}语法将环境变量注入配置。

### Kibana配置设置
1. **console.enabled** 默认值：true设置为false以禁用控制台。切换这将导致服务器在下次启动时重新生成资产，这可能会导致页面开始服务之前的延迟。
2. **cpu.cgroup.path.override:** 以与不一致的方式安装时覆盖cgroup cpu路径 /proc/self/cgroup
3. **cpuacct.cgroup.path.override:** 以与不一致的方式安装时覆盖cgroup cpuacct路径 /proc/self/cgroup
4. **elasticsearch.customHeaders:** 默认值：{}要发送到Elasticsearch的标头名称和值。无论elasticsearch.requestHeadersWhitelist配置如何，客户端标头都不能覆盖任何自定义标头。
5. **elasticsearch.logQueries:** 默认值：false记录发送到Elasticsearch的查询。需要logging.verbose设置为true。这对于查看当前没有间谍面板的应用程序生成的查询DSL非常有用，例如Timelion和Monitoring。
6. **elasticsearch.pingTimeout:** 默认值：elasticsearch.requestTimeout等待Elasticsearch响应ping的设置时间（以毫秒为单位）。
7. **elasticsearch.preserveHost:** 默认值：true当此设置的值为true时，Kibana使用server.host设置中指定的主机名。当此设置的值为时false，Kibana使用连接到此Kibana实例的主机的主机名。
8. **elasticsearch.requestHeadersWhitelist:** 默认值：[ 'authorization' ]要发送到Elasticsearch的Kibana客户端标头列表。发送无客户端的标头，将该值设置为[]（空列表）。
9. **elasticsearch.requestTimeout:** 默认值：30000等待来自后端或Elasticsearch的响应的时间（以毫秒为单位）。该值必须是正整数。
10. **elasticsearch.shardTimeout:**
默认值：30000 Elasticsearch等待分片响应的时间（以毫秒为单位）。设置为0以禁用。
11. **elasticsearch.ssl.certificate: 和 elasticsearch.ssl.key:**
可选设置，提供PEM格式SSL证书和密钥文件的路径。这些文件被用来验证Kibana到Elasticsearch身份和当需要 xpack.ssl.verification_mode在Elasticsearch被设置为certificate或full。
12. **elasticsearch.ssl.certificateAuthorities:**
可选设置，使您可以为Elasticsearch实例的证书颁发机构指定PEM文件的路径列表。
13. **elasticsearch.ssl.keyPassphrase:**
用于解密私钥的密码。此值是可选的，因为密钥可能未加密。
14. **elasticsearch.ssl.verificationMode:**
默认值：完全控制Elasticsearch提供的证书验证。有效值是none，certificate和full。 full执行主机名验证，certificate但没有。
15. **elasticsearch.startupTimeout:**
默认值：5000在重试之前在Kibana启动时等待Elasticsearch的时间（以毫秒为单位）。
16. **elasticsearch.url:**
默认值：“http：// localhost：9200”用于所有查询的Elasticsearch实例的URL。
17. **elasticsearch.username: 和 elasticsearch.password:**
如果您的Elasticsearch受基本身份验证保护，则这些设置提供Kibana服务器用于在启动时对Kibana索引执行维护的用户名和密码。您的Kibana用户仍需要使用通过Kibana服务器代理的Elasticsearch进行身份验证。
18. **elasticsearch.tribe.customHeaders:**
默认值：{}要发送到Elasticsearch的标头名称和值。无论elasticsearch.tribe.requestHeadersWhitelist配置如何，客户端标头都不能覆盖任何自定义标头。
19. **elasticsearch.tribe.pingTimeout:**
默认值：elasticsearch.tribe.requestTimeout等待Elasticsearch响应ping的设置时间（以毫秒为单位）。
20. **elasticsearch.tribe.requestHeadersWhitelist:**
默认值：[ 'authorization' ]要发送到Elasticsearch的Kibana客户端标头列表。发送无客户端的标头，将该值设置为[]（空列表）。
**elasticsearch.tribe.requestTimeout:**
默认值：30000等待来自后端或Elasticsearch的响应的时间（以毫秒为单位）。该值必须是正整数。
**elasticsearch.tribe.ssl.certificate: 和 elasticsearch.tribe.ssl.key:**
可选设置，提供PEM格式SSL证书和密钥文件的路径。这些文件验证您的Elasticsearch后端使用相同的密钥文件。
**elasticsearch.tribe.ssl.certificateAuthorities:**
可选设置，使您可以为部落Elasticsearch实例的证书颁发机构指定PEM文件的路径。
**elasticsearch.tribe.ssl.keyPassphrase:**
用于解密私钥的密码。此值是可选的，因为密钥可能未加密。
**elasticsearch.tribe.ssl.verificationMode:**
默认值：full控制证书的验证。有效值是none，certificate和full。full执行主机名验证，certificate但没有。
**elasticsearch.tribe.url:**
用于所有查询的Elasticsearch部落实例的可选URL。
**elasticsearch.tribe.username: 和 elasticsearch.tribe.password:**
如果您的Elasticsearch受基本身份验证保护，则这些设置提供Kibana服务器用于在启动时对Kibana索引执行维护的用户名和密码。您的Kibana用户仍需要使用通过Kibana服务器代理的Elasticsearch进行身份验证。
**kibana.defaultAppId:**
默认值：“discover”要加载的默认应用程序。
**kibana.index:**
默认值：“。kibana” Kibana使用Elasticsearch中的索引来存储已保存的搜索，可视化和仪表板。如果索引尚不存在，Kibana会创建一个新索引。
**logging.dest:**
默认值：stdout允许您指定Kibana存储日志输出的文件。
**logging.quiet:**
默认值：false将此设置的值设置true为禁止除错误消息之外的所有日志记录输出。
**logging.silent:**
默认值：false将此设置的值设置true为禁止所有日志记录输出。
**logging.verbose:**
默认值：false将此设置的值设置为true记录所有事件，包括系统使用信息和所有请求。在Elastic Cloud Enterprise上受支持。
logging.useUTC**
默认值：true将此设置的值设置为false使用服务器的时区而不是UTC记录事件。
**map.includeElasticMapsService:**
默认值：true打开或关闭Elastic Maps Service中的图层是否应包含在矢量和切片图层选项列表中。通过关闭此选项，将仅包括此处配置的图层。
**path.data:**
默认值：data Kibana存储未保存在Elasticsearch中的持久数据的路径。
**pid.file:**
指定Kibana创建进程标识文件的路径。
**ops.interval:**
默认值：5000设置采样系统和流程性能指标的时间间隔（以毫秒为单位）。最小值为100。
regionmap:**
指定用于区域地图可视化的其他矢量图层。每个图层对象都指向一个包含geojson FeatureCollection的外部矢量文件。在Elastic Cloud Enterprise上受支持。该文件必须使用WGS84坐标参考系统，并且只包含多边形。如果文件托管在与Kibana不同的域上，则服务器需要启用CORS，因此Kibana可以下载该文件。以下示例显示了有效的区域映射配置。

regionmap：
  includeElasticMapsService：false
  层：
     - 名称：“法国部门”
       网址：“http://my.cors.enabled.server.org/france_departements.geojson”
       归属地：“INRAP”
       字段：
          - 名称：“部门”
            描述：“完整的部门名称”
          - 名称：“INSEE”
            描述：“INSEE数字标识符”
**regionmap.layers[].name:**
强制性。正在提供的地图的描述。在Elastic Cloud Enterprise上受支持。
**regionmap.layers[].url:**
强制性。由web服务器提供的geojson文件的位置。在Elastic Cloud Enterprise上受支持。
**regionmap.layers[].attribution:**
可选的。引用geojson文件的原始源。在Elastic Cloud Enterprise上受支持。
**regionmap.layers[].fields[]:**
强制性。每个图层都可以包含多个字段，以指示您希望公开的geojson要素中的哪些属性。上面的示例显示了如何定义多个属性。在Elastic Cloud Enterprise上受支持。
**regionmap.layers[].fields[].name:**
强制性。此值用于在存储在Elasticsearch中的文档与geojson文件之间进行内部连接。例如，如果调用geojson中的字段Location并且具有城市名称，则Elasticsearch中必须存在一个字段，该字段保存与Kibana随后可用于查找地理位置数据的相同值。在Elastic Cloud Enterprise上受支持。
**regionmap.layers[].fields[].description:**
强制性。构建“区域地图”可视化时，“选项”选项卡下显示的人类可读文本。在Elastic Cloud Enterprise上受支持。
**regionmap.includeElasticMapsService:**
打开或关闭Elastic Maps Service中的图层是否应包含在矢量图层选项列表中。在Elastic Cloud Enterprise上受支持。通过关闭此选项，将仅包括此处配置的图层。默认值为true。
**server.basePath:**
如果您在代理后面运行，则可以指定安装Kibana的路径。使用该server.rewriteBasePath设置告诉Kibana是否应从其收到的请求中删除basePath，并防止在启动时发生弃用警告。此设置不能以斜杠（/）结尾。
**server.rewriteBasePath:**
默认值：false指定Kibana是否应重写带有前缀的请求server.basePath或要求它们由反向代理重写。此设置实际上始终false在Kibana 6.3之前，并且默认true在Kibana 7.0中启动。
**server.customResponseHeaders:**
默认值：{}从Kibana服务器发送到客户端的所有响应的头名称和值。
**server.defaultRoute:**
默认值：“/ app / kibana”此设置指定打开Kibana时的默认路径。您可以使用此设置在打开Kibana时修改登录页面。
**server.host:**
默认值：“localhost”此设置指定后端服务器的主机。
**server.maxPayloadBytes:**
默认值：1048576传入服务器请求的最大有效负载大小（以字节为单位）。
**server.name:**
默认值：“your-hostname”用于标识此Kibana实例的可读显示名称。
**server.port:**
默认值：5601 Kibana由后端服务器提供服务。此设置指定要使用的端口。
**server.ssl.enabled:**
默认值：“false”为从Kibana服务器到浏览器的传出请求启用SSL。设置为true，server.ssl.certificate并且server.ssl.key是必需的
**server.ssl.certificate: 和 server.ssl.key:**
分别是PEM格式SSL证书和SSL密钥文件的路径。
**server.ssl.certificateAuthorities:**
应信任的PEM编码证书文件的路径列表。
**server.ssl.cipherSuites:**
默认值：ECDHE-RSA-AES128-GCM-SHA256，ECDHE-ECDSA-AES128-GCM-SHA256，ECDHE-RSA-AES256-GCM-SHA384，ECDHE-ECDSA-AES256-GCM-SHA384，DHE-RSA-AES128-GCM- SHA256，ECDHE-RSA-AES128-SHA256，DHE-RSA-AES128-SHA256，ECDHE-RSA-AES256-SHA384，DHE-RSA-AES256-SHA384，ECDHE-RSA-AES256-SHA256，DHE-RSA-AES256-SHA256， HIGH，！aNULL，！eNULL，！EXPORT，！DES，！RC4，！MD5，！PSK，！SRP，！CAMELLIA。有关格式和有效选项的详细信息，请参见[OpenSSL密码列表格式文档]（ https://www.openssl.org/docs/man1.0.2/apps/ciphers.html#CIPHER-LIST-FORMAT）
**server.ssl.keyPassphrase:**
用于解密私钥的密码。此值是可选的，因为密钥可能未加密。
**server.ssl.redirectHttpFromPort:**
Kibana将绑定到此端口，并通过配置为的端口将所有http请求重定向到https server.port。
**server.ssl.supportedProtocols:**
默认值：TLSv1，TLSv1.1，TLSv1.2包含版本的受支持协议的数组。有效协议：TLSv1，TLSv1.1，TLSv1.2
**status.allowAnonymous:**
默认值：false如果启用了身份验证，则将此设置为true允许未经身份验证的用户访问Kibana服务器状态API和状态页面。
**tilemap.options.attribution:**
默认值："© [Elastic Maps Service](https://www.elastic.co/elastic-maps-service)"地图属性字符串。在Elastic Cloud Enterprise上受支持。
**tilemap.options.maxZoom:**
默认值：10最大缩放级别。在Elastic Cloud Enterprise上受支持。
**tilemap.options.minZoom:**
默认值：1最小缩放级别。在Elastic Cloud Enterprise上受支持。
**tilemap.options.subdomains:****
tile服务使用的子域阵列。在Elastic Cloud Enterprise上受支持。使用令牌指定子域的URL位置{s}。
**tilemap.url:******
Kibana用于在tilemap可视化中显示地图图块的tileservice的URL。默认情况下，Kibana从外部元数据服务读取此URL，但用户仍可以覆盖此参数以使用自己的Tile Map Service。例如："https://tiles.elastic.co/v2/default/{z}/{x}/{y}.png?elastic_tile_service_tos=agree&my_app_name=kibana"
**vega.enableExternalUrls:**
默认值：false将此值设置为true以允许Vega使用任何URL访问外部数据源和图像。如果为false，Vega只能从Elasticsearch获取数据。
