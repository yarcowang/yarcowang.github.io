---
category: r-bi-python-ai
series: note-deeplearning-pytorch

layout: post 
title:  "PyTorch进阶"
date:   2019-08-26 11:27:00 +0800
author: Yarco
---

### PyTorch进阶
#### Broadcasting
最前面增加一个维度, 然后将刚插入的维度size=1 => same size  
[4, 32, 14, 14] +   
[32, 1, 1] => [1, 32, 1, 1] => [4, 32, 14, 14]
#### 可广播的条件
小维度的size相符或等于1  
#### 合并与拆分
##### Cat
[4, 3, 8] + [5, 3, 8]  
torch.cat([a, b], dim=0) (非cat的维度上要一致)
##### Stack
维度需要一致. 会创建新的维度
##### Split
obj.split([len1, len2], dim=0)  
obj.split(len, dim=0)  
拆分的结果为tuple
##### Chunk
obj.chunk(len, dim=0)  
拆分的结果为tuple
#### 运算
##### 加减乘除
+-*/   或 torch.add/sub/mul/div  
##### 矩阵相乘
torch.mm -- 只针对2维  
torch.matmul 或 @ --  只取后2维 (前几维可以broadcast)  
例子, 线性层
##### 乘方pow, **, sqrt, rsqrt(sqrt再取倒数)
##### exp, log
##### 近似
floor, ceil, round, trunc, frac  
##### clamp
限制数值在某个范围
#### 统计属性
##### norm(范数) -- 向量/矩阵的norm有点区别
obj.norm(n, dim=0)
##### mean, sum, prod, max, min
##### argmin, argmax
##### topk, kthvalue (increment)
.topk(n, dim=0, largest = True)  
.kthvalue
##### 比较
&gt;, >=, <, <=, !=, ==  
torch.eq(a, b), 返回byte tensor  
torch.equal(a, b) 返回boolean  
#### 高级操作
##### where (为了GPU加速)
torch.where(condition, x, y)  
out_i = if condition x_i then y_i
##### gather(查表操作)
.gather(input, dim, index)
