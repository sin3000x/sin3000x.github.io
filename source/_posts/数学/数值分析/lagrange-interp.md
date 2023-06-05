---
title: 拉格朗日插值
abbrlink: 17585
mathjax: true
categories:
  - 数学
  - 数值分析
tags:
  - 多项式插值
  - 误差分析
date: 2022-01-23 13:19:31
---
$$p(x)=\sum_{k=0}^n y_kl_k(x)$$

## 基函数
给定点 $x_0,\ldots,x_n$. 问题归结于寻找**基函数** $$l_k(x_j)=\begin{cases}
    1\quad j=k\\
    0\quad j\ne k
\end{cases},$$
因为插值多项式可以写成它们的线性组合.

<!--more-->

根据零点分布可以设 $$l_k(x)=c\prod_{j\ne k}(x-x_j),$$ 代入 $x_k$ 得到

$$
1=l_k(x_k)=c\prod_{j\ne k}(x_k-x_j),
$$

于是 $c=\dfrac{1}{\prod_{j\ne k}(x_k-x_j)}$. 这就得到了 $$l_k(x)=\frac{\prod_{j\ne k}(x-x_j)}{\prod_{j\ne k}(x_k-x_j)}.$$

*注: 这个 $c$ 实际上是 Barycentric 权重, 即后面定义的 $\lambda_k$.*

它实际上就是一个特殊的多项式. 比如这是给定 $x_{0}:x_4=-2:2$, 在 $x_3$ 处取 $1$ 的基函数 $$l_3(x)=\frac{(x+2)(x+1)x(x-2)}{(1+2)(1+1)\cdot1\cdot(1-2)}$$

![](https://s2.loli.net/2023/04/10/R71SXIkVCmwZPsl.png)

定义节点函数 $$l(x)=\prod_{k=0}^n(x-x_k),$$ 可以得到基函数 $$l_j(x)={l(x)\over l'(x_j)(x-x_j)}$$

## Barycentric 插值公式
$$
p(x)={\sum_{k=0}^n{\lambda_k y_k\over x-x_k}\over\sum_{k=0}^n{\lambda_k\over x-x_k}},
$$
其中 $$\lambda_k={1\over\prod_{j\ne k}(x_k-x_j)}$$

## 误差

$f\in C^{n+1}([a,b])$时
$$f(x)-p(x)={f^{(n+1)}(\xi)\over (n+1)!}l(x),$$
其中 $\xi\in(a,b)$ 与 $x$ 有关.

---

$f$ 在包含节点的区域 $\Omega$ 上解析时

$$p(x)={1\over 2\pi i}\int_\Gamma{f(t)(l(t)-l(x))\over l(t)(t-x)}\d x$$
$$f(x)-p(x)={1\over 2\pi i}\int_\Gamma {l(x)\over l(t)}{f(t)\over t-x}\d t$$