---
category: r-bi-python-ai
series: note-machine-learning-in-action

layout: post 
title:  "k-近邻算法(kNN)概述"
date:   2019-03-17 17:12:20 +0800
author: Yarco
---

### k-近邻算法(kNN)概述

#### 准备: 使用Python导入数据
(plot图2.2 k近邻算法: 带有4个数据点的简单例子 -- 简单数据的代码)
数据:
```
[[1.  1.1]
 [1.  1. ]
 [0.  0. ]
 [0.  0.1]]
```

```python
import matplotlib.pyplot as plt
import knn

#%% plot 2-2
data, labels = knn.load_dataset()
plt.plot(data[:, 0], data[:, 1], 'o')
for idx in range(data.shape[0]):
    # print(labels[idx], (data[idx][0], data[idx][1]))
    plt.annotate(labels[idx], (data[idx][0] - 0.035 , data[idx][1] - 0.01))
plt.show()
```

##### 实施kNN分类算法
kNN.py 实现代码(注: 和原书不一样)
```python
import numpy as np
from collections import Counter


def load_dataset():
    data = np.array([[1.0, 1.1], [1.0, 1.0], [0, 0], [0, 0.1]])
    labels = ['A', 'A', 'B', 'B']
    return data, labels


def distance0(data, target):
    return np.sqrt(np.sum((data - target)**2, axis=1))

def distance1(data, target):
    return np.sum((data - target)**2, axis=1)

def predict0(target, data, labels, k):
    distances = distance0(data, target)
    kn = np.take(labels, distances.argsort()[:k])
    label, _ = Counter(kn).most_common()[0]
    return label

def predict1(target, data, labels, k):
    distances = distance1(data, target)
    kn = np.take(labels, distances.argsort()[:k])
    label, _ = Counter(kn).most_common()[0]
    return label
```
0,1方法的差别只是去掉了开方.

使用:
```python
data, labels = knn.load_dataset()
print(knn.predict0((0.8, 0.4), data, labels, 3))
```

显然, kNN中的特征之间需要相对平等(重要性), 否则该算法无法得到正确的结果. 即距离的结果(受x, y值影响 -- 比如x很重要但值很小)不能代表真实相近程度.
但我们可以看到从 sqrt(dX^2+dY^2)到 aX + bY (权重信息/dot product)的衡量标准的过度.


