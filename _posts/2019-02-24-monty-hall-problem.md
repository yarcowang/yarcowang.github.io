---
category: r-bi-python-ai
series: monty-hall-problem

layout: post 
title:  "三门问题的 R 随机模拟 (增强版)"
date:   2019-02-24 14:03:38 +0800
author: Yarco
---

[https://www.jianshu.com/p/a6cb0f46e7bb](https://www.jianshu.com/p/a6cb0f46e7bb)

```R
times <- 50000

results <- replicate(times, {
    # 放奖品
    doors <- c('A', 'B', 'C')
    prizes <- sample(c('car', 'goat', 'goat'))
    door_car <- doors[prizes == 'car']
    
    # A随机选一道门
    choosed <- sample(doors, 1)
    
    # 主持人打开不是车的
    door_goat <- sample(doors[!doors %in% c(choosed, door_car)], 1)
    
    # A坚持原选择
    # choosed == door_car
    # 0.33108
 
    # A重选
    # rechoosed <- sample(doors[!doors %in% c(door_goat)], 1)
    # rechoosed == door_car
    # 0.49982
    
    # A改选
    # changed <- sample(doors[!doors %in% c(choosed, door_goat)], 1)
    # changed == door_car
    # 0.66752

    # 来了一个新人B
    # new_guy_choosed <- sample(doors[!doors %in% c(door_goat)], 1)
    # new_guy_choosed == door_car
    # 0.50242
})

mean(results)
```

我觉得很多人在思考这个问题的时候之所以会选择1/2, 是站在“新人B/重选"的立场. 因为新人B的几率的确是1/2.
(注意: 重选与改选不同, 重选和新人B一个意思)
