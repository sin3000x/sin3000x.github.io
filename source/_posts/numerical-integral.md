---
title: 数值积分
mathjax: true
categories:
  - 数学
  - 数值分析
abbrlink: 24343
date: 2022-01-26 12:35:25
---
Quadrature Rule 指的是形式
$$Q(f)=\sum_{k=0}^nw_kf(x_k)$$

有时把 $f(x_k)$ 简写作 $f_k$.

<!--more-->

## Interpolation Rule
在插值多项式上求积分, 即 $$w_k=\int_a^b l_k(x)\d x$$

### Midpoint Rule
在中点处取 $0$ 次多项式.
$$Q(f)=(b-a)f(x_0),$$ 其中 $x_0$ 是区间中点. 精度为 $1$.

### Newton-Cotes Rules
区间上的等距节点. $n$ 为奇数时精度为 $n$, 偶数时精度为 $n+1$.

- $n=1$: trapezium rule 精度为 $1$ $$\frac h2(f_0+f_1)$$ 误差 $$I-Q=-\frac{1}{12}h^3 f''(\xi),\ \xi\in(a,b)$$
- $n=2$: Simpson's rule 精度为 $3$ $$\frac h3\left(f(x_0)+4f(x_1)+f(x_2)\right)$$ 误差 $$I-Q=-\frac{h^5}{90}f^{(4)}(\xi)=-\frac{(b-a)^5}{2880}f^{(4)}(\xi),\ \xi\in(a,b)$$

## Gauss Rule
寻找关于权重 $w(x)$ 精度最高的节点, 实际上是关于 $w(x)$ 的正交多项式的零点. 精度是 $2n+1$.

### Gauss-Legendre Quadrature $w(x)=1$
- $n=0$: $$\int_{-1}^1f(x)\d x\approx 2f(0)$$ 是中点法.
- $n=1$: $$\int_{-1}^1f(x)\d x\approx f\left(-\frac{1}{\sqrt 3}\right)+f\left(\frac{1}{\sqrt 3}\right)$$

### Gauss-Chebyshev Quadrature $w(x)=(1-x^2)^{-1/2}$
$x_0,\ldots,x_n$ 取 $T_{n+1}(x)$ 的零点, 即 Chebyshev 分点 $$x_k=\cos\left(\frac\pi2\frac{2k+1}{n+1}\right)$$

此时权重都是 $\displaystyle w_k=\frac{\pi}{n+1}$

## Composite Quadrature Rules
把区间等分后做积分.

### Composite Midpoint Rule
$$
M(h)=\sum_{k=0}^{n-1}hf\left(a+h\left(k+\frac12\right)\right)
$$ 误差 $$I-M=\frac{h^2}{24}(b-a)f''(\xi)$$

### Composite Trapezium Rule
$$T(h)=\frac h2\left(f(t_0)+2f(t_1)+2f(t_2)+\cdots+2f(t_{n-1})+f(t_n)\right)$$ 误差 $$I-T=-\frac{h^2}{12}(b-a)f''(\xi)$$

### Composite Simpson's Rule
$$S(h)=\frac{h}{3}\left(f(t_0)+4f(t_1)+2f(t_2)+4f(t_3)+\cdots+2f(t_{2m-2})+4f(t_{2m-1})+f(t_{2m})\right)$$ 误差 $$I-S=-\frac{h^4}{180}(b-a)f^{(4)}(\xi)$$

## Extrapolation
做组合消除误差. 令 $T_{k,1}=T(h/2^{k-1})$ 并构造表 $$T_{i,j}={4^{j-1}T_{i,j-1}-T_{i-1,j-1}\over 4^{j-1}-1}$$
每向右一列误差 $\times h^2$.