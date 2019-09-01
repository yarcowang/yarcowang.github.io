---
category: r-bi-python-ai
series: note-deep-learning-from-scratch

layout: post 
title:  "Numpy & Matplotlib"
date:   2018-11-29 23:50:20 +0800
author: Yarco
---

知识点:
* Numpy操作
* Matplotlib操作

1.5 Numpy

线性代数中的数据"矩阵", 在Python里的实现就是Numpy.
```python
>>> import numpy as np
>>> a = np.arange(0, 1, 0.1)
>>> a
array([ 0. ,  0.1,  0.2,  0.3,  0.4,  0.5,  0.6,  0.7,  0.8,  0.9])
```
read more: [Numpy Tutorial](https://docs.scipy.org/doc/numpy/user/quickstart.html)

1.6 Matplotlib

基于Numpy数据:
```python
import matplotlib.pyplot as plt

# plt.plot(x, y)
# plt.xlabel("..."), plt.ylabel("...")
# plt.title("...")
# plt.legend()
# plt.show()
```

基于Image的读取和输出:
```python
import matplotlib.pyplot as plt
from matplotlib.image import imread
img = imread('lena.png') 
plt.imshow(img)
plt.show()
```
read more: [Matplotlib Tutorial](https://matplotlib.org/tutorials/index.html)

