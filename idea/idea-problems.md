### mac下idea卡顿问题解决
idea在加载相对来说比较大的系统时，经常性出现卡顿，以至于写起代码特别难受.最后找到的解决方案是修改idea.vmoptions中的内存大小,
执行`find / -name idea.vmoptions`来找到文件的存放路径,然后对cd到`idea.vmoptions`所在到目录`vi idea.vmoptions`进行编辑：以下为参考配置，可以根据mac的硬件性能进行调整
```
-Xms750m
-Xmx750m
-XX:ReservedCodeCacheSize=640m
-XX:+UseCompressedOops
-XX:MaxMetaspaceSize=750m
```
