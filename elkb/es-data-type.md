## 字符串
- `string` 常规字符串
- `text` 该类型被用来索引长文本，在创建索引前会将这些文本进行分词，转化为词的组合，建立索引；允许es来检索这些词，text类型不能用来排序和聚合
- `keyword` 该类型不需要进行分词，可以被用来检索过滤、排序和聚合，keyword类型自读那只能用本身来进行检索（不可用text分词后的模糊检索）

## 数值型
- `long`
- `integer`
- `short`
- `byte`
- `double`
- `float`

## 日期型
- `date`

## 布尔型
- `boolean`

## 二进制型
- `binary`
