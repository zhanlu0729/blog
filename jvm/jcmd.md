## jstat命令使用
jstat命令可以查看堆内存各部分的使用量，以及加载类的数量。命令的格式如下：jstat [-命令选项] [vmid] [间隔时间/毫秒] [查询次数]
### jstat -class pid 类加载统计
| 参数 |     值             |
| --------- | ------------ |
| Loaded    | 加载class的数量 |
| Bytes     | 所占用空间大小 |
| Unloaded  | 未加载数量  |
| Bytes     | 未加载占用空间  |
| Time      | 时间   |

### jstat -compiler pid 编译统计
| 参数 |     值             |
| --------- | ------------ |
| Compiled    | 编译数量 |
| Failed     | 失败数量 |
| Invalid  | 不可用数量  |
| Time     | 时间  |
| FailedType      | 失败类型   |
| FailedMethod      | 失败的方法   |

