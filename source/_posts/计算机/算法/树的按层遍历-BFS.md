---
title: 树的按层遍历 (BFS)
categories:
  - 计算机
  - 算法
mathjax: true
abbrlink: 8322
date: 2022-09-05 20:31:52
---
```
    3
   / \
  9  20
 /  /  \
3  15   7
```
输出 `[3, 9, 20, 3, 15, 7]`.

<!--more-->

```py
from collections import deque

queue = deque([root])
result = []

while queue:
    node = queue.popleft()
    result.append(node.val)
    if node.left:
        queue.append(node.left)
    if node.right:
        queue.append(node.right)
```

## 要求保存每一层

```
    3
   / \
  9  20
 /  /  \
3  15   7
  /  \
 21  22 
```
输出 `[[3], [9, 20], [3, 15, 7], [21, 22]]`.

```py
queue = deque([root])
result = []

while queue:
    count = len(queue)  # 当前层有几个值?
    current_level = []
    for i in range(count):
        node = queue.popleft()
        current_level.append(node.val)
        if node.left:
            queue.append(node.left)
        if node.right:
            queue.append(node.right)
    result.append(current_level)
```
时间: $O(n)$

空间: $O(n)$  (最宽的那一层)