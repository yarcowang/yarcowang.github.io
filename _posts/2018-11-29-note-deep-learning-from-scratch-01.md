---
category: r-bi-python-ai
series: note-deep-learning-from-scratch

layout: post 
title:  "Python(极简描述)"
date:   2018-11-29 22:00:01 +0800
author: Yarco
---

(标题为原书, 这里放的是读后感)

知识点:
* 编程语言基础知识
* Python
* 一些通用结构: list, dict

1.1~1.4 Python(极简描述)

编程语言自然也是一种语言, 而且是简化的语言. 既然是语言(简化的), 那么显然就会包含"名词", "动词", "连词":
* 名词描述物体
* 动词描述行为
* 连词描述逻辑
不过因为程序中, 不像现实世界, 物体都是我们已经认知的, 所以"名词"需要我们自己去描述, 对于"名词"的描述, 构成了基本的程序构造: 数据结构.

数据结构中, 又可分为: 原始数据类型(不可再分), 通用数据类型(比如: 容器), 以及可自定义的类. Python中:
* 原始数据类型: int(整型), float(浮点), string(字符串) ---- 本质来说, 其实是面向机器(计算), 和面向人(描述)而分类的
* 通用数据类型: list(列表), dict(字典)
* 自定义的类: class ---- `__init__` (初始化方法)