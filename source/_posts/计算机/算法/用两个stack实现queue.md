---
title: 用两个 stack 实现 queue
categories:
  - 计算机
  - 算法
tags:
  - 栈
mathjax: true
abbrlink: 27896
date: 2022-08-15 20:34:20
---
```py
class Queue:
    def __init__(self) -> None:
        self.s1 = []  # entrance
        self.s2 = []  # exit

    def enqueue(self, x):
        self.s1.append(x)

    def dequeue(self):
        if not self.s2:
            while self.s1:
                self.s2.append(self.s1.pop())
        return self.s2.pop()

    def is_empty(self):
        return not self.s1 and not self.s2

    def size(self):
        return len(self.s1) + len(self.s2)
```

时间:

- 入队 $O(1)$
- 出队最差 $O(n)$, amortized $O(1)$