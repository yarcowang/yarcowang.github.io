---
category: r-bi-python-ai
series: note-grokking-algorithms

layout: post 
title:  "递归,栈,分治,快排与散列"
date:   2019-01-19 19:44:25 16:26:05 +0800
author: Yarco
---

### 递归

    我很喜欢 Leigh Caldwell 在 Stack Overflow 上说的一句话：“如果使用循环，程序的性能可能更高；如果使用递归，程序可能更容易理解。如何选择要看什么对你来说更重要。”
递归本质可以算一种循环, 只是借用了系统的栈做存储.

#### 基线条件和递归条件
* 基线条件
* 递归条件

#### 栈
push & pop
(2nd) 整型栈的 c语言代码(本人练习所用, 产品环境后果自负, 以下代码不再重复warning):
```c
#include <stdio.h>
#include <stdlib.h>

typedef struct int_stack {
    unsigned int cap;
    unsigned int used;
    int* data;
} int_stack;

int init_stack(int_stack* s, unsigned int n)
{
    s->cap = n;
    s->used = 0;
    s->data = (int *)malloc(sizeof(int) * n);
    if (s->data == NULL) {
        return -1;
    }

    return 0;
}

void free_stack(int_stack* s)
{
    free(s->data);
    s->cap = 0;
    s->used = 0;
    s->data = NULL;
}

int push_stack(int_stack* s, int data)
{
    if (s->cap <= s->used) return -1; // or realloc
    s->data[s->used++] = data;
    return 0;
}

int pop_stack(int_stack* s, int* data)
{
    if (s->used <= 0) return -1;
    *data = s->data[--s->used];
    return 0;
}

void print_stack(int_stack* s)
{
    printf("STACK=cap:%d used:%d\nContains: ", s->cap, s->used);
    for(int i = 0; i < s->used; i++) {
        printf("%d ", s->data[i]);
    }
    printf("\n");
}

int main() {
    int data[] = {3,1,4,1,5,9,2,6};
    int_stack s;

    int ret = init_stack(& s, sizeof(data)/sizeof(data[0]));
    if (ret == -1) return -1;

    for(int i = 0;i < 8; i++) {
        push_stack(& s, data[i]);
    }
    printf("after push...\n");
    print_stack(& s);

    int d;
    pop_stack(& s, &d);
    printf("popped %d\n", d);
    printf("after pop...\n");
    print_stack(& s);

    free_stack(& s);
    printf("after free...\n");
    print_stack(& s);
    return 0;
}
```

### 快速排序

####　分而治之
(2nd) 本质是针对非生物形态(好吧...我这里可能会说的不够精确), 比如一块石头, 那么它的性质其实完全可以由被切割出来的更小的石头所表达, 当大问题的解决完全可以通过寻找规模更小的问题的解决方案得到解决时, 这就是分而治之的场景.

####　快速排序
```python
def quicksort(arr):
    if len(arr) < 2:
        return arr
    
    pivot = arr[0]
    left = [i for i in arr[1:] if i < pivot]
    right = [i for i in arr[1:] if i >= pivot]
    ## O(2n)
    return quicksort(left) + [pivot] + quicksort(right)
## O(2n * log n)

print(arr)
print(quicksort(arr))
```

(2nd)快排(c版本), 快排难点在分区. 
```c
#include <stdio.h>

void quicksort(int* data, int l, int r);
int partition(int* data, int l, int r);
void showdata(const char* prefix, int* data, int l, int r);

int main()
{
    int data[] = {3, 1, 4, 1, 5, 9, 2, 6};
    showdata("Original:\n", data, 0, 8);
    quicksort(data, 0, 7);
    showdata("After:\n", data, 0, 8);
    return 0;
}

void quicksort(int* data, int l, int r)
{
    if (l < r) {
        int pos = partition(data, l, r);
        quicksort(data, l, pos-1);
        quicksort(data, pos+1, r);
    }
}

void showdata(const char* prefix, int* data, int l, int r)
{
    printf("%s", prefix);
    for(int i = l; i < r; i++) {
        printf("%d ", data[i]);
    }
    printf("\n");
}

int partition(int* data, int l, int r)
{
    int pivot = data[l];
    int pos = l;

    while (l < r) {
        while (l < r && pivot < data[r])  r--;
        if (l < r) {
            data[l] = data[r];
            data[r] = pivot;
            pos = r;
            l++;
        }

        while (l < r && pivot > data[l]) l++;
        if (l < r) {
            data[r] = data[l];
            data[l] = pivot;
            pos = l;
            r--;
        }
    }

    return pos;
}
```

### 散列表

(也称为字典或字值对)

#### 散列函数
(2nd) 散列表的关键点是选取散列函数. (因为已经存在大量散列函数, 我们只需要选取就行了) 但是优良的散列函数必定: 存储空间效率 (不会有大量的空间闲置, 并且同时有大量的冲突, 某种程度上来说和压缩算法有关联)

##### 填装因子
(一旦超过0.7, 就需要重新分配)
##### 良好的散列
均匀分布
Sha()
