---
title: 找到离原点第k近的点
categories:
  - 计算机
  - 算法
tags:
  - 堆
mathjax: true
abbrlink: 38610
date: 2022-09-10 12:11:41
---
利用大根堆:
```py
import heapq
from numpy.linalg import norm

def k_closest(points, k):
    h = []
    for i in range(len(points)):
        dist = - norm(points[i])
        heapq.heappush(h, (dist, i))
        if len(h) > k:
            heapq.heappop(h)  # 把最远的 pop 出去了

    return [points[item[1]] for item in h]
```