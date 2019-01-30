## 环境准备
|    名称    |     说明             |
| --------- | ------------ |
|     centos    | 7.x |
| libfatscommon | FastDFS分离出的一些公用函数包|
|      FastDFS  | FastDFS本体  |
| fastdfs-nginx-module| FastDFS和nginx的关联模块|
|     nginx     | nginx1.15.4  |

## 编译环境
yum install git gcc gcc-c++ make automake autoconf libtool pcre pcre-devel zlib zlib-devel openssl-devel wget vim -y

## 磁盘目录
|    位置    |     说明        |
| ---------  | ------------   |
| /usr/local/src | 所有安装包  |
| /data/fastdfs/ | 数据存储位置|
```
mkdir /data/fastdfs #创建数据存储目录
cd /usr/local/src #切换到安装目录准备下载安装包
```

## 概念和术语
1. **FastDFS**
```
FastDFS是一款开源的轻量级分布式文件系统纯C实现,支持Linux、FreeBSD等UNIX系统类google FS,不是通用的文件系统,只能通过专有API访问,目前提供了C、Java和PHP API为互联网应用量身定做,解决大容量文件存储问题,追求高性能和高扩展性FastDFS可以看做是基于文件的key value pair存储系统,称作分布式文件存储服务更为合适
```
2. **tracker-server**
```
跟踪服务器,主要做调度工作,起负载均衡的作用。在内存中记录集群中所有存储组和存储服务器的状态信息,是客户端和数据服务器交互的枢纽。相比GFS中的master更为精简,不记录文件索引信息,占用的内存量很少
```
3. **storage-server**
```
存储服务器(又称：存储节点或数据服务器),文件和文件属性(metadata)都保存到存储服务器上。Storage server直接利用OS的文件系统调用管理文件
```
4. **group**
```
组,也可称为卷。同组内服务器上的文件是完全相同的,同一组内的storage server之间是对等的,文件上传、 删除等操作可以在任意一台storage server上进行
```
5. **meta data**
```
meta data：文件相关属性,键值对(Key Value Pair)方式,如：width=1024,heigth=768
```


## 安装libfatscommon
1. `git clone https://github.com/happyfish100/libfastcommon.git --depth 1` #下载
2. `cd libfastcommon/`
3. `./make.sh && ./make.sh install` #编译安装

## 安装FastDFS
1. `cd ../` #返回上一级目录
2. `git clone https://github.com/happyfish100/fastdfs.git --depth 1` #下载
3. `cd fastdfs/`
4. `./make.sh && ./make.sh install` #编译安装
5. 配置文件准备
```
cp /etc/fdfs/tracker.conf.sample /etc/fdfs/tracker.conf
cp /etc/fdfs/storage.conf.sample /etc/fdfs/storage.conf
cp /etc/fdfs/client.conf.sample /etc/fdfs/client.conf #客户端文件，测试用
cp /usr/local/src/fastdfs/conf/http.conf /etc/fdfs/ #供nginx访问使用
cp /usr/local/src/fastdfs/conf/mime.types /etc/fdfs/ #供nginx访问使用
```

## 安装fastdfs-nginx-module
1. `cd ../` #返回上一级目录
2. `git clone https://github.com/happyfish100/fastdfs-nginx-module.git --depth 1` #下载
3. `cp /usr/local/src/fastdfs-nginx-module/src/mod_fastdfs.conf /etc/fdfs/`

## 安装nginx
1. `cd ../` #返回上一级目录
2. `wget http://nginx.org/download/nginx-1.15.4.tar.gz` #下载nginx压缩包
3. `tar -zxvf nginx-1.15.4.tar.gz` #解压
4. `cd nginx-1.15.4/`
5. 添加fastdfs-nginx-module模块
```
./configure --add-module=/usr/local/src/fastdfs-nginx-module/src/ 
make && make install #编译安装
```

## 单机部署
### tracker配置
1. `vim /etc/fdfs/tracker.conf`
2. 需要修改的内容如下：
```
bind_addr=ip
port=22122  # tracker服务器端口（默认22122,一般不修改）
base_path=/data/fastdfs  # 存储日志和数据的根目录
```
### storage配置
1. `vim /etc/fdfs/storage.conf`
2. 需要修改的内容如下：
```
port=23000  # storage服务端口（默认23000,一般不修改）
base_path=/data/fastdfs  # 数据和日志文件存储根目录
store_path0=/data/fastdfs  # 第一个存储目录
tracker_server=tracker_ip:22122  # tracker服务器IP和端口
http.server_port=8888  # http访问文件的端口(默认8888,看情况修改,和nginx中保持一致)
```
### client测试
1. `vim /etc/fdfs/client.conf`
2. 需要修改的内容如下：
```
base_path=/data/fastdfs
tracker_server=tracker_ip:22122 #tracker服务器IP和端口
```
3. `fdfs_upload_file /etc/fdfs/client.conf /etc/fdfs/client.conf` #保存后测试,返回ID表示成功 如：group1/M00/00/00/xx.conf
### 配置nginx访问
```
vim /etc/fdfs/mod_fastdfs.conf
#需要修改的内容如下
tracker_server=tracker_ip:22122  #tracker服务器IP和端口
url_have_group_name=true
store_path0=/home/dfs
#配置nginx.config
vim /usr/local/nginx/conf/nginx.conf
#添加如下配置
server {
    listen       8888;    ## 该端口为storage.conf中的http.server_port相同
    server_name  localhost;
    location ~/group[0-9]/ {
        ngx_fastdfs_module;
    }
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
    root   html;
    }
}
#测试下载，用外部浏览器访问刚才已传过的nginx安装包,引用返回的ID
http://192.168.52.1:8888/group1/M00/00/00/wKgAQ1pysxmAaqhAAA76tz-dVgg.tar.gz
#弹出下载单机部署全部跑通
```

## 分布式部署
### tracker配置
1. `vim /etc/fdfs/tracker.conf`
2. 需要修改的内容如下：
```
bind_addr=ip
port=22122  # tracker服务器端口（默认22122,一般不修改）
base_path=/data/fastdfs  # 存储日志和数据的根目录
```
### storage配置
1. `vim /etc/fdfs/storage.conf`
2. 需要修改的内容如下：
```
port=23000  # storage服务端口（默认23000,一般不修改）
base_path=/data/fastdfs  # 数据和日志文件存储根目录
store_path0=/data/fastdfs  # 第一个存储目录
tracker_server=tracker1_ip:22122  # 服务器1
tracker_server=tracker2_ip:22122  # 服务器2
tracker_server=tracker3_ip:22122  # 服务器3
http.server_port=8888  # http访问文件的端口(默认8888,看情况修改,和nginx中保持一致)
```
### client测试
1. `vim /etc/fdfs/client.conf`
2. 需要修改的内容如下：
```
base_path=/data/fastdfs
tracker_server=tracker1_ip:22122  # 服务器1
tracker_server=tracker2_ip:22122  # 服务器2
tracker_server=tracker3_ip:22122  # 服务器3
```
3. `fdfs_upload_file /etc/fdfs/client.conf /etc/fdfs/client.conf` #保存后测试,返回ID表示成功 如：group1/M00/00/00/xx.conf
### 配置nginx访问
```
vim /etc/fdfs/mod_fastdfs.conf
#需要修改的内容如下
tracker_server=tracker1_ip:22122  # 服务器1
tracker_server=tracker2_ip:22122  # 服务器2
tracker_server=tracker3_ip:22122  # 服务器3
url_have_group_name=true
store_path0=/home/dfs
#配置nginx.config
vim /usr/local/nginx/conf/nginx.conf
#添加如下配置
server {
    listen       8888;    ## 该端口为storage.conf中的http.server_port相同
    server_name  localhost;
    location ~/group[0-9]/ {
        ngx_fastdfs_module;
    }
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
    root   html;
    }
}
#测试下载，用外部浏览器访问刚才已传过的nginx安装包,引用返回的ID
http://192.168.52.1:8888/group1/M00/00/00/wKgAQ1pysxmAaqhAAA76tz-dVgg.tar.gz
#弹出下载单机部署全部跑通
```

## 启动
### 防火墙
1. 不关闭防火墙的话无法使用
2. systemctl stop firewalld.service #关闭
3. systemctl restart firewalld.service #重启
### tracker
1. `/etc/init.d/fdfs_trackerd start` #启动tracker服务
2. `/etc/init.d/fdfs_trackerd restart` #重启动tracker服务
3. `/etc/init.d/fdfs_trackerd stop` #停止tracker服务
4. `chkconfig fdfs_trackerd on` #自启动tracker服务
### storage
1. `/etc/init.d/fdfs_storaged start` #启动storage服务
2. `/etc/init.d/fdfs_storaged restart` #重动storage服务
3. `/etc/init.d/fdfs_storaged stop` #停止动storage服务
4. `chkconfig fdfs_storaged on` #自启动storage服务
### nginx
1. `/usr/local/nginx/sbin/nginx` #启动nginx
2. `/usr/local/nginx/sbin/nginx -s reload` #重启nginx
3. `/usr/local/nginx/sbin/nginx -s stop` #停止nginx
### 检测集群
1. `/usr/bin/fdfs_monitor /etc/fdfs/storage.conf` #会显示会有几台服务器 有3台就会 显示 Storage 1-Storage 3的详细信息

## 说明
### 配置文件
1. `tracker_server` #有几台服务器写几个
2. `group_name` #地址的名称的命名
3. `bind_addr` #服务器ip绑定
4. `store_path_count` #store_path(数字)有几个写几个
5. `store_path(数字)` #设置几个储存地址写几个 从0开始
### 可能遇到的问题
1. 如果不是root用户,你必须在除了cd的命令之外,全部加sudo
2. 如果不是root用户,编译和安装分开进行,先编译再安装
3. 如果上传成功,但是nginx报错404 先检查mod_fastdfs.conf文件中的store_path0是否一致
4. 如果nginx无法访问,先检查防火墙 和 mod_fastdfs.conf文件tracker_server是否一致
5. 如果不是在/usr/local/src文件夹下安装,可能会编译出错
6. 安装时报错：`/usr/include/fastdfs/fdfs_define.h:15:27: fatal error: common_define.h: No such file or directory`
- `vim /usr/local/src/fastdfs-nginx-module/src/config` 
- 改变的文件内容：
```
ngx_module_incs="/usr/include/fastdfs /usr/include/fastcommon/"
CORE_INCS="$CORE_INCS /usr/include/fastdfs /usr/include/fastcommon/"
```
