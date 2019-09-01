---
category: r-bi-python-ai
series: note-machine-learning-in-action

layout: post 
title:  "示例: 使用kNN改进约会网站的配对效果"
date:   2019-03-27 16:57:45 +0800
author: Yarco
---

#### 示例: 使用kNN改进约会网站的配对效果
数据地址: [http://pan.baidu.com/s/1hsbVTdE](http://pan.baidu.com/s/1hsbVTdE)

载入数据:
```python
def load_datingTestDataset():
    data = np.genfromtxt('./data/datingTestSet2.txt', delimiter='\t')
    return data[:, :3], data[:, -1]
```

##### 分析数据: 使用Matplotlib创建散点图
(可以发现即便只有3个特征, 完全分析, 也需要, 3(单变量)+3(双变量)+1(3变量)种)
书中描述第1列和第2列具有明显分类特征.

##### 准备数据: 归一化数值
```python
def normalize0(data):
    mins = np.min(data, 0)
    maxs = np.max(data, 0)
    ds = maxs - mins
    return (data - mins)/ds
```

##### 测试算法
```python
def test_datingDataset():
    batch_size = 100 # fixed in this case
    data, labels = load_datingTestDataset()
    data = normalize0(data)
    errors = 0

    for i in range(batch_size):
        result = predict1(data[i], data[batch_size:], labels[batch_size:], 3)
        if result != labels[i]:
            errors += 1
    print("Error rate is: %.2f%%(%d in %d)" % (errors * 100 / batch_size, errors, batch_size))
```
结果是:
Error rate is: 5.00%(5 in 100)

##### 使用算法: 构建完整可用系统
(就是做客户端的意思, 给出一系列提问, 然后得到推荐~)

