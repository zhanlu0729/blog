### 常用操作(MySQL)
1. **``SHOW DATABASES``** 列出实例中所有库信息
2. **``SHOW TABLES``** 列出库中所有表信息
3. **``SHOW CREATE TABLE`` 表名** 查看表的所有信息
4. **``DESC`` 表名** 查看表的字段信息
5. **``ALTER TABLE`` 表名_src RENAME TO 表名_dest** 修改表名
6. **``ALTER TABLE`` 表名 ADD COLUMN 列名 varchar(30)** 添加列
7. **``ALTER TABLE`` 表名 DROP COLUMN 列名** 删除列
8. **``ALTER TABLE`` 表名 MODIFY 列名 varchar(22)** 修改列属性
9. ALTER TABLE 表名 ADD CONSTRAINT 主键 （形如：PK_表名） PRIMARY KEY 表名(主键字段); 添加主键约束
10. ALTER TABLE 从表 ADD CONSTRAINT 外键（形如：FK_从表_主表） FOREIGN KEY 从表(外键字段) references 主表(主键字段); 添加外键约束
11. ALTER TABLE 表名 DROP PRIMARY KEY; 删除主键约束
12. ALTER TABLE 表名 DROP FOREIGN KEY 外键（区分大小写）; 删除外键约束
