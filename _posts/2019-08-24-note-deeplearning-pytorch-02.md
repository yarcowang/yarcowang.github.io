---
category: r-bi-python-ai
series: note-deeplearning-pytorch

layout: post 
title:  "PyTorch基础"
date:   2019-08-24 18:08:44 +0800
author: Yarco
---

### PyTorch基础
#### 张量的数据类型 (also cuda)
IntTensor, LongTensor,  
FloatTensor, DoubleTensor

#### 如何处理String
* one-hot
* Embedding
    * Word2vec
    * glove

#### 类型检查
obj.type() 或 isinstance(obj, torch.FloatTensor)

#### Dimension & Size
obj.shape  
obj.size()  
obj.dim()

* Dimension 0 / Rank 0 标量:   torch.tensor(0.1)
* Dimension 1 / Rank 1 向量:   torch.tensor([0.1])
* ...
* Dimension 3 / Rank 3: (normally used in RNN)
* Dimension 4 / Rank 4: (normally used in CNN)

#### 创建Tensor
##### 从numpy导入
torch.from_numpy(...)
##### 从list导入
torch.tensor([...])
##### 未初始化的 (使用时要小心, 不好直接使用 -- 就像一般程序中的规则)
torch.empty(shape)  
torch.Tensor(shape)
##### 设置默认类型
torch.set_default_tensor_type(torch.DoubleTensor) // Reinforce Learning 增强学习中通常用DoubleTensor
##### 随机初始化
torch.rand(shape): 随机均匀初始化, 介于[0,1]  
torch.randint(min, max, shape)  
torch.randn(shape): 正态分布  
torch.normal(mean=, std=)  
*_like(tensor): 同shape
##### full, ones, zeros, eye
torch.full(shape, value)  
torch.full([], value) -- scalar
##### 等差数列
torch.arange(left, right, step) -- right不包含
##### linspace/logspace
torch.linspace(0, 10, steps=4)   -- 包含0, 10等分切割4份  
torch.logspace(0, -1, steps=10) -- 最后一个值是 0.1         
##### randperm
torch.randperm(10) -- 生成随机打散的[0, 10)数列

#### 索引与切片
##### first/last n
a[:2] first 2
a[:] 所有
a[1:] first 1 to end
a[-1:] last 1 to end
##### 有间隔的
a[::2] 
##### 通过索引选择
obj.index_select(dim, index)
##### ... 所有余下的维度
Ex.: a[:, ..., :2]
##### take
flatten之后的index

#### 维度变换
##### view/reshape
两个是一样的, reshape是为了与numpy api一致  
view_as(obj)
##### squeeze/unsqueeze (挤压/展开)
unsqueeze -- 增加维度, 数值为 [-a.dim()-1, a.dim()+1)  
squeeze() -- 尽可能缩减维度  
squeeze(idx) -- 根据idx缩减维度
##### expand/repeat
expand: broadcasting, expand(shape) 只能1->N, 例子: b.expand(4, 32, 14, 14) (b.shape = 1, 32, 14, 14)  如果写-1, 则表示不变  
repeat: memory copied (占用空间)  repeat(...拷贝的次数...)
##### 转置 .t() 只能适用于矩阵
##### transpose()
##### permute() -- 参数是 index of the dim


