## SVN常用命令
### 检出
1. svn co/checkout http://路径(目录或文件的全路径)　[本地目录全路径] --username 用户名 --password 密码
2. svn co/checkout svn://路径(目录或文件的全路径)　[本地目录全路径] --username 用户名 --password 密码

### 导出(导出一个干净的不带.svn文件夹的目录树)
1. svn export [-r 版本号] http://路径(目录或文件的全路径) [本地目录全路径]　--username　用户名
2. svn export [-r 版本号] svn://路径(目录或文件的全路径) [本地目录全路径]　--username　用户名
3. svn export 本地检出的(即带有.svn文件夹的)目录全路径 要导出的本地目录全路径

### 添加新文件
1. svn add 文件名
2. svn ci/commit -m "提交备注信息文本"

### 提交
1. svn ci/commit -m　"提交备注信息文本" [-N]　[--no-unlock] 文件名
2. svn ci/commit -m "提交当前目录下的全部在版本控制下的文件" * ＜－ 注意这个*表示全部文件

