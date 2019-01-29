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
1. `vim /etc/fdfs/client.conf`
2. 需要修改的内容如下：
```
base_path=/data/fastdfs
tracker_server=tracker_ip:22122 #tracker服务器IP和端口
```
3. `fdfs_upload_file /etc/fdfs/client.conf /etc/fdfs/client.conf` #保存后测试,返回ID表示成功 如：group1/M00/00/00/xx.conf
