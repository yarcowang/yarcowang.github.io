---
category: r-bi-python-ai
series: note-grokking-algorithms

layout: post 
title:  "图,队列与树"
date:   2019-02-10 15:07:35 +0800
author: Yarco
---

本帖知识点概览:
* 图
* 队列
* 树

### 广度优先搜索
(BFS, breadth-first search)

#### 图介绍
#### 图是什么
图是节点与边的集合. 

#### 广度优先搜索
回答两类问题:
1. 是否存在A->B的路径
2. 具体的最短路径

##### 队列
FIFO.

#### 图的实现
* 有向图
* 无向图

书中用dict来存储图, 但是是单向关系.

### 狄克斯特拉算法
* 加权图
* 非加权图

适用于：有向无环图

