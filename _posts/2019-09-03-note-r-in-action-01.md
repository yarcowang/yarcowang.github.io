---
category: r-bi-python-ai
series: note-r-in-action

layout: post 
title:  '创建数据集'
date:   2019-09-03 21:48:01 +0800
author: Yarco
---

### 创建数据集

#### 数据集的概念
#### 数据结构
##### 向量(vector)
* c()
* 2:6 -- 序列
* seq() -- 序列
##### 矩阵(matrix)
* matrix(vector, nrow=, ncol=)
##### 数组(array)
* array(vector, dimensions, dimnames) -- dimensions最前面的为最内层(有点相反)
##### 数据框(data.frame)
* data.frame(col1, col2, col3...)
* df[1:2]或df[c('col1', 'col2')]或df$col1 引用data frame的变量
* attach(), detach(), with()
##### 因子(factor)
分为名义变量和有序变量
* 名义变量: factor(vector)
* 有序变量: 
    * factor(vector, ordered=TRUE)
    * factor(vector, ordered=TRUE, levels=c(...))指定顺序
    * factor(vector, ordered=TRUE, levels=c(...), labels=c(...))如果值是数值, 需要指定意义
##### 列表(list)
* list(obj1, obj2, ...)
* 列表可以指定名字: list(name1=obj1, name2=obj2, ...)
#### 数据的输入
##### 从键盘输入
##### 从文件输入
* read.table
* read.csv
* read.*
##### 从数据库
* odbcConnect
* R* DBI包
##### 网页抓取
##### 数据集的标注


#### 处理对象的实用函数
* length
* dim
* str -- 查看数据结构
* class
* mode
* names
* head, tail




