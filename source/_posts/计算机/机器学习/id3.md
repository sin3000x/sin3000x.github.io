---
title: 决策树的信息增益
categories:
  - 计算机
  - 机器学习
mathjax: true
abbrlink: 56956
date: 2022-07-22 10:37:36
---
基于熵减, 或者说信息增益, 来决定决策树的 feature 选择. ID3 算法优先 split 可以带来最大熵减的那个 feature, 也就是一种贪心算法.

<!--more-->

如果一件事情的发生概率为 $p$, 它带来的 entropy 被定义为 $-\log_2 p$: 它的概率越小, 给系统带来的扰动就越大, 熵趋于无穷; 它的概率为 1 时, 没有任何不确定性, 熵为 0. 可以按不同的事件划分做加权平均. 在下面的例子中, A, B, C 为 feature, U 为 label.

|Real Avatar(A)|Friends(B)|Blog(C)|Real User Account (U)|
|---|---|---|---|
|N|S|S|N|
|Y|L|S|Y|
|Y|M|L|Y|
|Y|M|M|Y|
|Y|M|L|Y|
|N|L|M|Y|
|N|S|M|N|
|N|M|L|Y|
|N|S|M|Y|
|Y|S|S|N|

一共有 10 条数据, Y 占 7 条, N 占 3 条. 那么本身的熵为
$$
H=-0.7\times\log_20.7-0.3\times\log_20.3=0.8813
$$

**以计算 A 为例...**

A 把数据分成了两类. 对 Y 类:

|Real Avatar(A)|Real User Account (U)|
|---|---|
|Y|Y|
|Y|Y|
|Y|Y|
|Y|Y|
|Y|N|

熵为
$$
-0.8\times\log_20.8-0.2\times\log_20.2=0.7219
$$
对 N 类:

|Real Avatar(A)|Real User Account (U)|
|---|---|
|N|N|
|N|Y|
|N|N|
|N|Y|
|N|Y|

熵为
$$
-0.6\times\log_20.6-0.4\times\log_20.4=0.9710
$$

对整体进行加权平均, 就是按 A 分类带来的熵:
$$
H_A=0.5\times0.7219+0.5\times0.9710=0.8465
$$

按 A 分类带来的熵减就是 $0.8813-0.8465=0.0348$.