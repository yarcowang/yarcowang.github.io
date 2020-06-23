---
category: r-bi-python-ai
series: note-grokking-algorithms

layout: post 
title:  "算法简介"
date:   2020-06-23 09:17:48 +0800
author: Yarco
---

分享地址: [https://gitbook.cn/gitchat/geekbook/5a9cb0c0a80c047e76c23c4f](https://gitbook.cn/gitchat/geekbook/5a9cb0c0a80c047e76c23c4f)  
代码库: [https://github.com/egonschiele/grokking_algorithms](https://github.com/egonschiele/grokking_algorithms)

### 算法简介
思考函数`y = f(x)`, 算法的本质是考察试图找到合理的`f`, 使得从已知`x`可以得到恰当的`y`.

* 如果问题比较简单, 通过人为的方式可以清晰的分解得到几个步骤, 从而获得`y`, 像最初在介绍算法时我们遇到的那样(做菜过程);
* 如果问题可以分解为较小规模的独立问题, 那么就是分治问题, 通常可以通过递推/递归解决; 
* 如果问题被分解为子问题时, 子问题需要依赖一组状态信息, 可以称这个`f`为动态规划; 
* 如果没有非常显示的处理办法并且引入x1, 会影响到全局的解法`f` (即有可能是NPC问题), 那么就可能需要通过构造数据组(深度学习)来解`f`,称为人工智能. 

这些都属于相对精确有效的寻找解法的思想, 相对而言`贪婪法`与`穷举法`就显得暴力.

####　二分查找
针对的是有次序的静态序列. 有次序意味着有大小, 意味着可基于大小做排除.  
(举个例子: 分词中的查字典 [https://www.npmjs.com/package/seg-zhcn](https://www.npmjs.com/package/seg-zhcn) 多年前js写的分词)

c语言实现（我自己~ 当练习c, 感觉这里的难度是边界不好掌握, 参考: https://stackoverflow.com/questions/39221303/binary-search-algorithm-implementations?rq=1)
(我这里写  int right = strlen(s); 然后循环用小于 while (left < right) { 发现也是对的)
```c
#include <stdio.h>
#include <string.h>

int binary_search(char ch, const char* s);

int main()
{
	const char* const data = "abcdefghijklmnopqrstuvwxyz";

	printf("---- data ----\n");
	for(int i = 0; i < strlen(data); i++) {
		printf("%d=%c\t", i, data[i]);
	}
	printf("\n");
	printf("---- result ----\n");
	printf("i=%d\n", binary_search('i', data));
	printf("o=%d\n", binary_search('o', data));
	printf("x=%d\n", binary_search('x', data));
	
	return 0;
}

int binary_search(char ch, const char* s)
{
	int left = 0;
	int right = strlen(s) - 1; 
	int middle;

	while (left <= right) { 
		middle = (left + right) / 2; // 看来这里 middle = left + (right - left) >> 1; 更好 

		if (ch == s[middle]) {
			return middle;
		} else if (ch < s[middle]) {
			right = middle;
		} else {
			left = middle;
		}
	}

	return -1;
}
```

#####　一些常见的大 O 运行时间
O(log n), O(n), O(n log n), O(n^2), O(n!)  
(有序的, 线性空间...)  
像是降维:  低维度 <------ 线性世界 -------> 高维度  

##### 旅行商
(2nd) 貌似O(n!)算法与积分之间存在某种关系, 需要思考?

### 选择排序

####　数组和链表
数组: 针对相对固定的情况, +随机访问, +索引(关键字,下标关系)  
链表: 删减频繁

(2nd) 链表实现: https://www.learn-c.org/en/Linked_lists

####　选择排序
通常教选择排序会讲打牌这件事, 这里作者的例子是音乐播放次数的排序, 但我觉得另外一件事情可能更令人印象深刻.........择偶. 

```python
import numpy as np

arr = np.random.randint(10, size=10)

def findSmallest(arr):
    max = arr[0]
    idx = 0
    for i in range(1, len(arr)):
        if arr[i]<max:
            max = arr[i]
            idx = i
    return idx, max

findSmallest(arr)

## O(n)

print(arr)
def selectionSort(arr):
    ret = arr.copy()
    for i in range(0, len(ret)):
        idx, max = findSmallest(ret[i:])
        ret[i], ret[idx+i] = ret[idx+i], ret[i]
    return ret

print(selectionSort(arr))
```

书里的:
```python
def findSmallest(arr):
  smallest = arr[0]  ←------存储最小的值
  smallest_index = 0  ←------存储最小元素的索引
  for i in range(1, len(arr)):
    if arr[i] < smallest:
      smallest = arr[i]
      smallest_index = i
  return smallest_index

def selectionSort(arr):  ←------对数组进行排序
  newArr = []
  for i in range(len(arr)):
      smallest = findSmallest(arr)  ←------找出数组中最小的元素，并将其加入到新数组中
      newArr.append(arr.pop(smallest))
  return newArr

print selectionSort([5, 3, 6, 2, 10])
```

(2nd) C语言版本: (注: 此为本人学习代码, 请勿用到产品环境, 不保证代码质量)
```c
#include <stdio.h>
#include <stdlib.h>

void show_array(int* data, size_t s)
{
	for(size_t i = 0; i < s; i++) {
		printf("%d ", data[i]);
	}
	printf("\n");
}

size_t find_max(int* data, size_t s, size_t offset)
{
	int max = data[offset];
	size_t pos = offset;

	for(size_t i = offset + 1; i < s; i++) {
		if (max < data[i]) {
			max = data[i];
			pos = i;
		}
	}	

	return pos;
}

void selection_sort(int* data, size_t s) {
	for(size_t sorted = 0; sorted < s; sorted++) {
		size_t pos = find_max(data, s, sorted);
		int tmp = data[pos];
		data[pos] = data[sorted];
		data[sorted] = tmp;
	}
}

int main() {
	int data[] = {3, 1, 4, 5, 7, 2, 8, 1};
	show_array(data, sizeof(data)/sizeof(data[0]));
	selection_sort(data, sizeof(data)/sizeof(data[0]));
	show_array(data, sizeof(data)/sizeof(data[0]));
	return 0;
}
```
