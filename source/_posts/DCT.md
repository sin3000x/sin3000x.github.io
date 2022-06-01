---
title: 控制收敛定理 (DCT)
mathjax: true
categories:
  - 数学
  - 分析
  - 实变函数
abbrlink: 34980
date: 2022-01-18 17:07:42
---
$$\lim_{n\to\infty}\int_S f_n \,d\mu=\int_S f\,d\mu$$

<!--more-->

条件: 

- $f_n$ 可测, 逐点收敛到 $f$. 
- $f_n$ 被可积函数 $g$ 控制: $|f_n(x)|\leq g(x)$, 且 $\int_S|g|\,d\mu<\infty.$

结论:

- $f$ 可积
- $\lim_{n\to\infty}\int_S|f_n-f|\,d\mu=0$
- $\lim_{n\to\infty}\int_S f_n \,d\mu=\int_S f\,d\mu$