---
title: 检查 Binary search tree (BST)
categories:
  - 计算机
  - 算法
tags:
  - 树
mathjax: true
abbrlink: 32064
date: 2022-08-19 21:36:02
---
定义: 对每个节点, 左子树的值都比它小, 右子树的值都比它大.
```
     10
    /  \
   5    15
  / \   / \
 2   7 12 20
```
```py
def BST(root):
    if root is None:
        return True
    min_val = float('-inf')
    max_val = float('inf')
    return isBST(root, min_val, max_val)

def isBST(root, min_val, max_val):
    if root is None:
        return True
    if root.val <= min_val or root.val >= max_val:
        return False
    return isBST(root.left, min_val, root.val) and isBST(root.right, root.val, max_val)
```