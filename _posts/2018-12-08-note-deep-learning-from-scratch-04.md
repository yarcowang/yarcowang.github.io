---
category: r-bi-python-ai
series: note-deep-learning-from-scratch

layout: post 
title:  "神经网络的学习"
date:   2018-12-08 13:33:01 +0800
author: Yarco
---

知识点:
* 神经网络与一般机器学习的区别
* 损失函数: 均方误差, 交叉熵误差

第4章 神经网络的学习(权重和偏置的计算)

4.1.1 数据驱动
神经网络与一般机器学习的区别.

一般机器学习: 
* 找出特征量(SIFT、SURF 和 HOG ?)
* 分类器算法(SVM、KNN?)

4.2 损失函数
损失函数本质是前面有效性方法的具体细节化,  因为我们目标是尝试找出权重和偏置.
需要尽可能的表达结果值和计算值之间的误差.

4.2.1 均方误差
```python
def mean_squared_error(y, t):
    return .5 * np.sum((y-t)**2) ## 为何乘以 .5?
```

4.2.2 交叉熵误差
```python
def cross_entropy_error(y, t):
    delta = 1e-7
    return -np.sum(t * np.log(y + delta))
```

(为何用两种误差? 个人以为是基于"结果" -- 各因素之间是否具有平等关系?? 比如图像结果1,2,3,5... 很显然是平等的, 但有时分类也许比较模糊, 可能互相包含, 这种情况也许用交叉熵误差更合理 -- 个人猜测)

4.2.3 mini-batch 学习
类同数据分析统计里抽取一部分sample, 在计算损失值的时候, 我们也是针对部分数据:
```python
train_size = x_train.shape[0]
batch_size = 10
batch_mask = np.random.choice(train_size, batch_size)
x_batch = x_train[batch_mask]
t_batch = t_train[batch_mask]
```

 