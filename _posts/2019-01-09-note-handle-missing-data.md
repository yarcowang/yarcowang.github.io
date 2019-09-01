---
category: r-bi-python-ai
series: note-handle-missing-data

layout: post 
title:  "笔记: 处理缺失值"
date:   2019-01-09 23:02:40 +0800
author: Yarco
---

* [https://towardsdatascience.com/how-to-handle-missing-data-8646b18db0d4](https://towardsdatascience.com/how-to-handle-missing-data-8646b18db0d4)
* 中文译文: [http://www.sohu.com/a/270489022_308467](http://www.sohu.com/a/270489022_308467)

1. MCAR ---- 因为完全是随机的(也就是根本没啥关系), 所以可以完全删除. (不太可能都是这样的数据)
2. MAR ---- 这种随机貌似建立在已有的完全变量之上(形象的说法象是基于已有样本, 行相关) 所以很有可能从某种程度上可以从 已有的完全变量推导出 MAR. 所以也可以去掉.
3. MNAR ---- 这种缺失是基于它自身的(所以无法从已有的完全变量中找到相关原因, 列相关) 需要成为研究的一部分. (因为这本来就是研究的对象)
(但是判断到底是哪种情况需要什么呢?)
