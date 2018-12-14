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
2. svn ci/commit -m "提交备注信息文本" * 注意这个*表示全部文件

### 更新文件
1. svn up/update 后面没有目录，默认将当前目录以及子目录下的所有文件都更新到最新版本
2. svn up/update　-r 修正版本 文件名
3. svn up/update 文件名

### 删除文件
1. svn del/delete svn://路径(目录或文件的全路径) -m "提交备注信息文本"
2. svn ci/commit -m "提交备注信息文本"

### 加锁/解锁
1. svn lock -m　"提交备注信息文本"　[--force]　文件名 
2. svn unlock 文件名

### 比较差异
1. svn diff 文件名
2. svn diff -r　修正版本号m:修正版本号n　文件名

### 查看文件或者目录状态
1. svn st/status 目录路径/文件名 目录下的文件和子目录的状态，正常状态不显示【?：不在svn的控制中；M：内容被修改；C：发生冲突；A：预定加入到版本库；K：被锁定】
2. svn -v 目录路径/文件名 
3. svn st/status -v 目录路径/文件名 显示文件和子目录状态【第一列保持相同，第二列显示工作版本号，第三和第四列显示最后一次修改的版本号和修改人】 

### 查看日志
1. svn log 文件名

### 查看文件详细信息
1. svn info 文件名

### 查看版本库下的文件和目录列表
1. svn ls/list　svn://路径(目录或文件的全路径)

### 创建纳入版本控制下的新目录
1. svn mkdir 目录名
2. svn mkdir -m　"提交备注信息文本"　http://目录全路径
3. 注：添加完子目录后，一定要回到根目录更新一下，不然在该目录下提交文件会提示"提交失败"

### 恢复本地修改
1. svn revert [--recursive] 文件名 注意: 本子命令不会存取网络，并且会解除冲突的状况。但是它不会恢复被删除的目录

### 把工作拷贝更新到别的URL
1. svn sw/switch http://目录全路径　本地目录全路径

### 解决冲突
1. svn resolved [本地目录全路径] 可以仅仅删除冲突的文件并且提交，但是svn resolved除了删除冲突文件，还修正了一些记录在工作拷贝管理区域的记录数据

### 不checkout而查看输出特定文件或URL的内容
1. svn cat http://文件全路径

### 新建一个分支copy
1. svn copy branchA branchB -m "make B branch" //从branchA拷贝出一个新分支branchB

### 合并内容到分支merge
1. svn merge branchA branchB //把对branchA的修改合并到分支branchB

### SVN帮助
1. svn help 全部功能选项
2. svn help ci 具体功能的说明


注：svn status、svn diff和 svn revert这三条命令在没有网络的情况下也可以执行的，原因是svn在本地的.svn中保留了本地版本的原始拷贝
