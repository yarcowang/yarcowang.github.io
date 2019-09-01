---
category: c-more
series: leetcode-problems

layout: post 
title:  '397. 整数替换'
date:   2019-08-30 14:34:54 +0800
author: Yarco
---

[https://leetcode-cn.com/problems/integer-replacement/](https://leetcode-cn.com/problems/integer-replacement/)

给定一个正整数 n，你可以做如下操作：

1. 如果 n 是偶数，则用 n / 2替换 n。
2. 如果 n 是奇数，则可以用 n + 1或n - 1替换 n。
n 变为 1 所需的最小替换次数是多少？
```c
int integerReplacement(int n){
    if (n == 1) return 0;
    if (n == 2) return 1;
    if (n == INT32_MAX) return 32;
    if (n % 2) {
        int l = integerReplacement(n - 1);
        int r = integerReplacement(n + 1);
        return l > r ? r + 1 : l + 1;
    } else {
        return 1 + integerReplacement(n >> 1);
    }
}
```

(... PLACEHOLDER ...)

