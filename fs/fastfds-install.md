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
