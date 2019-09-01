---
category: r-bi-python-ai
series: note-deeplearning-pytorch

layout: post 
title:  "随机梯度下降"
date:   2019-08-27 21:59:55 +0800
author: Yarco
---

### 随机梯度下降
#### 梯度介绍
导数, 偏微分,   
梯度(向量)  
* 梯度的模代表了强度;
* 梯度的方向代表了增长方向.  
theta_t+1 = theta_t - alpha * delta f(theta_t)  
(梯度更新)  

#### 影响搜索过程的因素
* 局部极小值与全局解解释(固有) -- 解决方法: 动量momentum
* 鞍点(固有)
* 初始点(初始化方法, hekaiming)
* Learning Rate (0.001, 0.005) -- Learning Rate decay

#### 常见函数的梯度 (略)

#### 激活函数介绍
* 分段函数(不可导)
* sigmoid/logistic

求导, 问题
* tanh (RNN中用的比较多) = 2 sigmoid(2x) - 1
* ReLU

#### Loss
##### MSE
MSE  loss = norm(2)^2

* 求导  
torch.autograd.grad(pred, [x...])
或者
loss.backward()

##### Softmax

(... 课时40-46 ...)
