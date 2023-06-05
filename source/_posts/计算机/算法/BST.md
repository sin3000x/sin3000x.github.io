---
title: BST
categories:
  - 计算机
  - 算法
tags:
  - 树
mathjax: true
abbrlink: 7069
description: '二叉搜索树的判断, 查询, 插入.'
date: 2022-08-23 20:49:47
---
## 判断: 中序遍历
```py
def inorder(root, prev):
    if root is None:
        return True
    if inorder(root.left, prev) == False:
        return False
    if root.val <= prev[0]:
        return False
    prev[0] = root.val
    if inorder(root.right, prev) == False:
        return False
    return True

def is_bst(root):
    prev = [float('-inf')]
    return inorder(root, prev)
```

## 判断: 先序遍历 (向下传递)
```py
def helper(root, m, M):
    if root is None:
        return True
    if not (m < root.val < M):
        return False
    return helper(root.left, m, root.val) and helper(root.right, root.val, M)

def is_bst(root):
    return helper(root, float('-inf'), float('inf'))
```

## 搜索: 递归
```py
def query(root, target):
    if root is None:
        return None
    if root.key == target:
        return root
    if root.key > target:
        return query(root.left, target)
    else:
        return query(root.right, target)
```
时间: $O(h)$

空间: $O(h)$

## 搜索: 迭代
```py
def query(root, target):
    cur = root
    while cur and cur.key != target:
        if cur.key > target:
            cur = cur.left
        else:
            cur = cur.right
    return cur
```
时间: $O(h)$

空间: $O(1)$

## 插入
```py
def insert(root, key):
    if root is None:
        return Node(key)
    if key < root.key:
        root.left = insert(root.left, key)
    elif key > root.key:
        root.right = insert(root.right, key)
    return root
```
时间: $O(h)$

空间: $O(h)$