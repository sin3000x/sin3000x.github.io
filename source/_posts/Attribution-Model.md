---
title: Attribution Model
categories:
  - 计算机
  - 机器学习
mathjax: true
abbrlink: 53003
date: 2023-03-21 21:49:49
---

客户在从看到产品广告到完成购买经历了很多事件，怎么给这些事件的重要性分配 credit？

<!--more-->

## Single Source (Touch) Attribution

把所有的 credit 分给一个事件。比如 3 days last touch：往回看三天，分给最近的 marketing vehicle 。

缺点：

- 鼓励频繁发邮件，长期不利
- 一次折扣有帮助，长期不利
- 新用户需要很多次点击才会购买，会忽视初始几次事件

## Fractioned Attribution

多个事件有权重。比如：首末两个事件占 40%，中间的事件平分 20%。

缺点是难以确定最佳权重。

## Machine Learning

比如有两个 action，构建 feature：

1. action 1 出现的位置是 1
2. action 1 出现的位置是 2
3. action 2 出现的位置是 1
4. action 2 出现的位置是 2

如果一个顾客经历了 action 1 -> action 2 后买了，那么 $x=(1, 0, 0, 1),\ y=1$。

如果一个顾客经历了 action 2 就买了，那么 $x=(0, 0, 1, 0),\ y=0$。

如果有 $n$ 个 action，就要有 $n^2$ 个 binary feature。

逻辑回归之后，设它们的系数是 $k_1,\ldots,k_n$。那么 action 1 的 credit 就是 $\frac{k_1+\cdots+k_n}{\sum k_i}$，action 2 的 credit 就是 $\frac{k_{n+1}+\cdots+k_{2n}}{\sum k_i}$，以此类推。
