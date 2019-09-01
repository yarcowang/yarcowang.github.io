---
category: r-bi-python-ai
series: note-deep-learning-from-scratch

layout: post 
title:  "感知机与神经网络"
date:   2018-11-30 13:25:35 +0800
author: Yarco
---

知识点:
* 感知机构成
* 神经网络构成
* 激活函数与输出层的设计: ReLU, sigmoid, softmax
* 有效性判断(test first)

2 感知机(非常棒的一章, 需要细读, 这里简略)

文章先简单介绍了下感知机, 然后讲逻辑电路, 然后再具体介绍感知机. 只是, 思考数学, 既然数学中有代数和逻辑两者, 感知机本质是两者的结合体. 而布尔逻辑就只是逻辑, 所以感知机能够实现电子电路的布尔逻辑其实就是必然的.

通过调节权重和偏置(2nd: 这里主要关注的是权重/偏置, 而不是一般情况下我们认为的输入/输出, 通过调节权重偏置来符合输入输出), 可以用感知机实现与门, 或门, 与非门.
而要实现异或门(或相等),  就要使用多层感知机. (因为异或是非线性的, 思考为什么?)
(多层感知机理论可以实现计算机)

原始的感知机实现的与门:
```python
def AND(x1, x2):
    w1, w2, theta = .5, .5, .7 # fixed
    total = x1 * w1 + x2 * w2
    if total > theta:
        return 1
    else:
        return 0
```

使用权重和偏置的实现(+numpy)实现的与门:
```python
import numpy as np

def AND2(x1, x2):
    x = np.array([x1, x2])
    w = np.array([.5, .5]) # 调节w, b可以实现与非门和或门
    b = -.7 # 而通过组合与非门, 或门和与门, 可以实现异或门
    total = np.sum(x * w) + b
    if total > 0:
        return 1
    else:
        return 0
```

3 神经网络

3.2 激活函数

将感知机中的输出更加一般化, 就变成了神经网络, 其中"更一般化"所使用的函数为"激活函数".
激活函数需要采用非线性函数.
(这里有个疑问:
到底是因为激活函数采用非线性所以能解决非线性问题, 还是因为多层所以才能解决非线性问题????
猜测是因为世界比较复杂, 所以实际两者都需要, 但可能需要理论证明?)

3.2.1 sigmoid函数

sigmoid函数可以使值散布到(0,1)区间, 在>3或<-3时, 变化趋势趋于平缓. (猜测: 更适合集中化趋势高的数据, 不适合相对离散的数据)
(感觉做为输出层的激活函数更好点)

sigmoid与阶跃函数图像:
```python
import numpy as np
import matplotlib.pylab as plt

def step_func(x):
    return np.array(x > 0, dtype = np.int)

def sigmoid(x):
    return 1 / (1 + np.exp(-x))
    
x = np.arange(-5.0, 5.0, 0.1)
y = step_func(x)
y2 = sigmoid(x)
plt.plot(x, y)
plt.plot(x, y2)
plt.ylim(-0.1, 1.1)
plt.show()
```

3.2.7 ReLU 函数

ReLU函数感觉更复合现实世界的感受, 假如有样东西你比较关注, 那么你会想知道更多细节; 假如有样东西你不想关注, 那么细节怎么样其实就没意义了.
```python
def relu(x):
    return np.maximum(0, x)
```

3.4.3　代码实现小结(代码小结, 逻辑上可以放在最后, 但学习角度确实放这里更适合)
```python
import numpy as np

def sigmoid(x):
    return 1 / (1 + np.exp(-x))

def identity_function(x):
    return x

''' for n x 2: n chaining models, 2 categories '''
def init_network():
    network = {}
    network['W1'] = np.array([[.1, .3, .5], [.2, .4, .6]]) # 2x3
    network['b1'] = np.array([.1, .2, .3])
    network['W2'] = np.array([[.1, .4], [.2, .5], [.3, .6]]) # 3x2
    network['b2'] = np.array([.1, .2])
    network['W3'] = np.array([[.1, .3], [.2, .4]]) # 2x2
    network['b3'] = np.array([.1, .2])
    return network

def forward(network, x):
    W1, W2, W3 = network['W1'], network['W2'], network['W3']
    b1, b2, b3 = network['b1'], network['b2'], network['b3']
    a1 = np.dot(x, W1) + b1
    z1 = sigmoid(a1)
    a2 = np.dot(z1, W2) + b2
    z2 = sigmoid(a2)
    a3 = np.dot(z2, W3) + b3
    y = identity_function(a3)
    return y

network = init_network()
x = np.array([1.0, .5])
y = forward(network, x)
print(y)
```

3.5 输出层的设计

本质而言, 整个神经网络也可以称之为感知机, 因此, 前几个隐含层所采用的一般化的激活函数, 到了最后的输出层, 需要思考逻辑关系的判断. 因此输出层的设计会针对不同的具体问题, 采用不用的应对算法.

分类问题: sigmoid函数(二元), softmax函数(多元)
回归问题: 恒等函数

3.5.2　实现 softmax 函数时的注意事项(softmax函数阐述)

* 为何可以用softmax进行多元分类?
假如有很多因数xn可以导致某个结果, 那么我们假定这是一种内积, 类似之前的 w1*x1+w2*x2+...+wn*xn = Result.
但我们很清楚的知道, 不同因素之间不可能是线性关系, 也就是说很有可能是x1^2 + x2^3 + x3^6 + ... + xn^m ~ Result (忽略w, m不规则), 那么实际上我们其实关注的是m, 所以最终某个因素对结果的影响力可以用 a^x1 / (a^x1+a^x2+...+a^xn) 表示. 取a = e, 就是softmax.

 * softmax函数结果是聚合值(类平均数), 所以需要涉及多个输入
 ```python
def softmax(x):
    exp_x = np.exp(x)
    sum_exp_x = np.sum(exp_x)
    y = exp_x / sum_exp_x
    return y 
```
(实验: 组合sigmoid+identify, sigmoid+softmax, relu+softmax, relu+sigmoid查看不同结果)

3.6 手写数字识别

利用已训练好的数据模型, 对MNIST数据集进行效果测试. 其中包含:
* 数据载入
* 中间结果保存
* 有效性判断 (符合测试为先的现代开发流)
* 批处理

具体细节参考本书:
```python
# 数据载入
# ...
# 神经网络初始化(载入已有模型)
# ...

def predict(network, x):
    W1, W2, W3 = network['W1'], network['W2'], network['W3'] ## 输入部分
    b1, b2, b3 = network['b1'], network['b2'], network['b3']
    a1 = np.dot(x, W1) + b1 ## forward部分
    z1 = sigmoid(a1)
    a2 = np.dot(z1, W2) + b2
    z2 = sigmoid(a2)
    a3 = np.dot(z2, W3) + b3
    y = softmax(a3) ## 输出部分

    return y

# 有效性测试
# ...
```

(整体上看, 会有以下几点值得思考的地方:
* 输入数据的优化
* 神经网络层的数量, 神经元数量的决定
* 激活函数的选择
* 输出策略的抉择
* 有效性的判断)

(2nd)代码: (可能和前面有点不一致)
```python
# 神经网络
def network():
    w1 = np.random.random((784, 300))
    b1 = np.random.random(300)
    w2 = np.random.random((300, 115))
    b2 = np.random.random(115)
    w3 = np.random.random((115, 44))
    b3 = np.random.random(44)
    w4 = np.random.random((44, 10))
    b4 = np.random.random(10)
    return (w1,w2,w3,w4),(b1,b2,b3,b4)
    
def relu(x):
    return np.maximum(0, x)

def softmax(x):
    m = np.max(x)
    exp = np.exp(x - m)
    sum_exp = np.sum(exp)
    return exp / sum_exp

def forword(x, w, b):
    steps = len(w)
    for i in range(steps):
        if i != steps - 1:
            x = relu(np.dot(x, w[i]) + b[i])
        else:
            x = softmax(np.dot(x, w[i]) + b[i])
    return x

w, b = network()
x = np.random.random(784)
t = forword(x, w, b)
print(t)
```

 