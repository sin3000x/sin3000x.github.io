---
title: 常见的ODE解法
tags:
  - 数学
  - 分析
mathjax: true
abbrlink: 65228
date: 2022-01-08 14:20:11
---
### 1. 可分离变量 $y'=p(y)q(x)$

分离变量后两边积分.

### 2. 一阶齐次线性 $y'+p(x)y=0$

$$
y=Ce^{-\int p(x)dx}
$$

### 3. 一阶非齐次线性 $y'+p(x)y=q(x)$
- $y=e^{-\int p(x)dx}\left(C+\int q(x)e^{\int p(x)}dx\right)$

- 取积分因子 $\mu(x)=e^{\int p(x)dx}$.

> 🌰    $y'-2y/x=0$.
> $$\begin{aligned}
    &\mu(x)=e^{\int-\frac2x dx}=e^{-2\ln x}=\frac{1}{x^2}\\
    &\implies{1\over x^2}y'-{2\over x^3}y=0\\
    &\implies\left({y\over x^2}\right)'=0\\
    &\implies y=Cx^2
\end{aligned}
$$