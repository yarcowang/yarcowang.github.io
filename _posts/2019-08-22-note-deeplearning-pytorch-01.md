---
category: r-bi-python-ai
series: note-deeplearning-pytorch

layout: post 
title:  "回归问题"
date:   2019-08-22 11:06:25 +0800
author: Yarco
---

### 回归问题

#### 简单回归问题
梯度下降算法介绍.

Closed Form Function -> 最小二乘法/MSE

#### 回归实战 (my code, 不是根据教材的)
```python
import numpy as np


x = np.random.rand(1000) * 10
e = np.random.rand(1000) * .001
y = 1.34 * x + 3.2 + e


def calculate_mse_loss(x, y, w, b):
    return np.sqrt(np.sum((x * w + b - y) ** 2) / x.size)


w = 1.0
b = 1.0
lr = 0.001
for epoch in range(500):
    for batch in range(50):
        selected = np.random.choice(1000, 20)
        w_grad = np.sum(2 * (x * w + b - y) * x) / x.size
        b_grad = np.sum(2 * (x * w + b - y)) / x.size
        # print(f'w_grad={w_grad}, b_grad={b_grad}')
        w -= lr * w_grad
        b -= lr * b_grad
        loss = calculate_mse_loss(x, y, w, b)
        print(f'{epoch} {batch} loss: {loss}  => w: {w}, b: {b}')
```
结果:

    ...
    499 48 loss: 0.0002890098645823041  => w: 1.340004312025753, b: 3.200477140660802
    499 49 loss: 0.0002890098284746475  => w: 1.340004311350661, b: 3.200477145179688

#### 分类实战(MNIST)
ReLU激活函数.

(这里尝试用Adam替换了SGD, 发现效果更好 -- 私人认为:  优化器对逼近速度有帮助, 但整体精度取决于网络结构本身)
```python
import torch
import torchvision
import torch.optim as optim

from torch.utils.data import DataLoader, Dataset
from torch import nn
from torch.nn import functional as F
from utils import plot_image, plot_curve, one_hot

batch_size = 512

train_loader = DataLoader(
    torchvision.datasets.MNIST('data', train=True, download=True, transform=torchvision.transforms.Compose([
        torchvision.transforms.ToTensor(),
        torchvision.transforms.Normalize((0.1307,),(0.3081,))
    ])), batch_size=batch_size, shuffle=True
)

test_loader = DataLoader(
    torchvision.datasets.MNIST('data', train=False, download=True, transform=torchvision.transforms.Compose([
        torchvision.transforms.ToTensor(),
        torchvision.transforms.Normalize((0.1307,), (0.3081,))
    ])), batch_size=batch_size, shuffle=True
)

x, y = next(iter(train_loader))
print(x.shape, y.shape, x.min(), x.max())
plot_image(x, y, 'image sample')


class MyNet(nn.Module):

    def __init__(self):
        super().__init__()
        self.fc1 = nn.Linear(28*28, 256)
        self.fc2 = nn.Linear(256, 64)
        self.fc3 = nn.Linear(64, 10)

    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x


net = MyNet()
optimizer = optim.Adam(net.parameters(), lr=0.001)

train_loss = []
for epoch in range(3):
    for batch_idx, (x, y) in enumerate(train_loader):
        x = x.view(x.size(0), 28*28)
        out = net(x)
        y_one_hot = one_hot(y)
        loss = F.mse_loss(out, y_one_hot)

        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

        train_loss.append(loss.item())

        if batch_idx % 10 == 0:
            print(f'[{epoch} {batch_idx}] {loss.item()}')

plot_curve(train_loss)

total_correct = 0
for x, y in test_loader:
    x = x.view(x.size(0), 28*28)
    out = net(x)
    pred = out.argmax(dim=1)
    correct = pred.eq(y).sum().float().item()
    total_correct += correct

total_num = len(test_loader.dataset)
acc = total_correct / total_num
print(f'test acc: {acc}')
```


