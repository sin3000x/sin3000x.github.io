---
title: BST中的第二大元素
categories:
  - 计算机
  - 算法
mathjax: true
abbrlink: 32090
date: 2022-09-10 13:16:34
---
## 解法一

反向的中序遍历, 第二个节点就是第二大的.
```py
class Solution:
    def second_largest(self):
        self.count = 0
        self.result = None
        self.traverse(root)
        return self.result
    
    def traverse(self, root):
        if not root:
            return
        self.traverse(root.right)
        self.count += 1
        if self.count == 2:
            self.result = root.val
            return       
        if self.count > 1:
            return
        self.traverse(root.left)
```
时间: $O(h)$
空间: $O(h)$

## 解法二

分类讨论.
```py
def find_largest(root):
    if not root:
        return
    if not root.right:  # 没有右子树时, 根是最大的
        return root
    return find_largest(root.right)  # 有右子树时, 找其中最大的

def find_2nd_largest(root):
    if not root:
        return
    if not root.right:  # 没有右子树, 根最大; 左子树的最大就是第二大
        return find_largest(root.left)
    # 有右子树, 此时最大元素在右子树中
    right = root.right
    # 右子树只有一个节点, 它是最大的, 根第二大
    if not right.left and not right.right:  
        return root
    # 右子树还有子树, 在这里面找第二大的
    return find_2nd_largest(right)
```