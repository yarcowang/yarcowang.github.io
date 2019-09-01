---
category: r-bi-python-ai
series: note-all-of-statistics

layout: post 
title:  "Probability (概率)"
date:   2019-04-25 17:25:04 +0800
author: Yarco
---

### Probability (概率)

#### Probability(概率)
概率是描述不确定性的数学语言.

#### Sample Spaces and Events (样本空间与事件)
样本空间是某次实验的可能的结果集. 样本空间的点被称为"sample outcomes", "realizations" or "elments". 样本空间的子集被称为事件.  
(想象一个树状结构, 从左至后, 基于不同行为/结果分叉, 比如掷骰子, 分叉为不同点数, 继续掷就继续分叉. 所有的叶子, 就是样本空间的点, 而取一部分叶子就是事件)

(所以这里涉及集合的一些运算)

mutually exclusive (互斥) 应该是指没有共同的叶子. 交集是空集.

####  Probability
将事件A对应到一个具体值P(A) 称为A的概率.(所以也是个映射/函数?)
P为概率分布或概率度量(probability measure)

P需要满足3个公理:
1. 对于任意的A, P(A)>=0
2. P(Ω) = 1
3. 假如Ai是互斥的, 他们的并集的概率等于他们概率的和

(从样本空间, 对应到概率分布的空间...应该是这样...)

#### Probabilty on Finite Sample Space(有限样本空间上的概率)

如果每个结果可能性是一样的, 那么就叫等概率分布(?uniform probability distribution), 通过计数的方法可以确定概率. P(A) = |A| / |Ω|

(这里会有排列组合的一些运算)

#### Independent Event(独立事件)
P(AB) = P(A)P(B)  
独立性由两种方式产生, 一种我们假定两事件独立, 还有一种通过这个公式推导.
事件互斥并不代表它们是独立的. 

#### Conditional Probability(条件概率)
P(A|B) = P(AB)/P(B) (当P(B)>0)  
(读: A given B)  
(人们很容易混淆 P(A|B) 与 P(B|A) 类似混淆 充分条件和必要条件, 虽然这里的A/B并没有因果关系)

#### Bayes' Theorem(贝叶斯定理)
贝叶斯定理是专家系统与贝叶斯网络的基础. 

定理:
P(B) = ΣP(B|Ai)P(Ai)    #1  
P(Ai|B) = P(AiB) / P(B) = P(AiB) /#1 = P(B|Ai)P(Ai) / #1  
P(Ai)为prior probability (先验概率), P(Ai|B)为posterior probability(后验概率).
