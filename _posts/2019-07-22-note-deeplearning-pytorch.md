---
category: r-bi-python-ai
series: note-deeplearning-pytorch

layout: post 
title:  "深度学习初见"
date:   2019-07-22 21:16:38 +0800
author: Yarco
---

### 深度学习初见
#### 深度学习框架简介
PyTorch历史.

现状:
* Google: Theano -> TensorFlow1 -> TensorFlow2 -> Keras API
* Facebook: Torch / Caffe -> Caffe2 -> PyTorch
* Amazon: MXNet

TensorFlow 与 PyTorch的区别.

PyTorch生态:
* NLP:  PyTorch NLP, AllenNLP
* Vision: TorchVision
* 图: PyTorch geometric, Fast.ai
* 部署: ONNX

#### PyTorch功能演示
* GPU加速
* 自动求导

```python
import torch
import torch.nn as nn

a = torch.tensor(1.0, requires_grad=True)
b = torch.tensor(2.0, requires_grad=True)
c = torch.tensor(3.0, requires_grad=True)

x = 1.0
y = a**2 * x + b * x + c
y.backward()
print(f'a={a.grad}, b={b.grad}, c={c.grad}')
```
结果是: 2 1 1

常用网络层:
* nn.Linear
* nn.Conv2d
* nn.LSTM
* (以下是激活函数)
* nn.ReLU
* nn.Sigmoid
* nn.Softmax
* (以下是Loss计算函数)
* nn.CrossEntropyLoss
* nn.MSE

### 开发环境安装(略)
