---
title: dereference 与 shallow copy
categories:
  - 计算机
  - Python
mathjax: true
abbrlink: 6370
date: 2022-07-03 10:21:53
---
```python
x = [0]
y = x
```
此时修改 `x` 或 `y` 不影响另一个变量:
```python
x = [1]
print(y)  # [0]
```

如果有 dereference, 被修改:
```python
x = [0]
y = x

y[0] = [1]
print(x)  # [1]
```
<!--more-->

---

下面的例子中, `foo` 中的 `x` 是一个浅拷贝, 在第一次 `append` 的时候同时修改了原来的 `x`, 但在赋值为 2 时浅拷贝指向了新的地址, 之后的操作都是对浅拷贝进行的.
```python
def foo(x):
    x.append(1)
    x = [2]
    x.append(1)
    return x

x = [0]
foo(x)
print(x)  # [0, 1]
```