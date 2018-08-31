### 镜像常用操作
01. 列出镜像：`docker images`
02. 提取镜像：`docker pull imageName:tag`
03. 推送镜像：`docker push imageName:tag`
04. 删除镜像：`docker rmi imageId|name` {-f：强止删除有产生的容器}
05. 构建镜像：`docker build -t usename/imageId|name:tag Dockerfile路径` {-t：指定镜像名, --no-cache:不使用缓存}
06. 镜像打标签：`docker tag imageId|name usename/imageId|name:tag`
07. 导出镜像：`docker save imageId|name > fileName.tar`
08. 导入镜像：`docker load < fileName.tar`
09. 查看镜像构建过程 `docker history imageId|name`
	
### 容器常用操作
01. 列出容器：`docker ps` {-a：所有容器, -l：最近创建的容器, -n：列出最近创建的n个容器, -s：列出容器大小}
02. 创建并启动容器：`docker run -i -t imageId|name /bin/bash` {--restart:always/on-failure:5, --name:容器名, -d:守护进程, -i:标准输入, -t:模拟终端, -p:宿主机port:容器port}
03. 执行命令：`docker exec -i -t containerId|name linux命令`
04. 停止容器：`docker stop containerId|name`
05. 终止容器：`docker kill containerId|name`
06. 启动容器：`docker start containerId|name`
07. 重启容器：`docker restart containerId|name`
08. 删除容器：`docker rm containerId|name` {-f：强止删除运行的容器}
09. 导出容器为文件：`docker export containerId|name > xxx.tar`
10. 导入文件为镜像 `docker import xxx.tar usename/imageId|name:latest`
11. 提交镜像：`docker commit containerId|name usename/imageId|name:latest`
12. 显示日志：`docker logs containerId|name` {-f:实时显示日志, --tail=n：显示最后n行日志, -t：日志产生的时刻}
13. 查看容器内进程：`docker top containerId|name`
14. 查看容器配置：`docker inspect containerId|name`
15. 查看容器端口映射： `docker port containerId|name 容器中端口`
	
### Dockerfile脚本
01. 基础镜像：FROM baseImage
02. 维护者信息：MAINTAINER username "email"
03. 镜像构建时设置环境变量：ENV 变量键值 {run时可用-e覆盖}
04. 容器工作目录：WORKDIR xxx/xxx {run时可用-w覆盖}
05. 运行容器的用户：USER username {run时可用-u覆盖,不指定时默认为root}
06. 容器卷：VOLUME ["xxx/xxx"]
07. 添加本地文件到镜像：ADD xxx.tar.gz /opt {自动解压,本地文件需放到Dockerfile的相对目录,容器中目录不存在自动创建}
07. 复制本地文件到镜像：COPY xxx.tar.gz /opt {和ADD相似,不自动解压,本地文件需放到Dockerfile的相对目录,容器中目录不存在自动创建}
05. 设置构建镜像时执行的命令：RUN ln -s /opt/xxx.tar.gz /opt/xxx
06. 设置容器启动时执行的命令：CMD ["xxx/xxx","xxx","xxx"] {若指定多条,只有最后一条会被使用,可被run中命令覆盖}
07. 设置容器启动时执行的命令：ENTRYPOINT ["xxx/xxx","xxx","xxx"] {功能和CMD相似,run时可用--entrypoint覆盖}
  
1.Harbor中项目名长度最大为30个字符
