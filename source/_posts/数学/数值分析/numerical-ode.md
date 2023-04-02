---
title: 数值 ODE
abbrlink: 23214
mathjax: true
categories:
  - 数学
  - 数值分析
date: 2022-01-26 16:19:10
---
$f_n$ 是 $f(x_n,y_n)$ 的简记, $y_n$ 是 $y(x_n)$ 的估计.

<!--more-->

## One-Step Methods
形式是
$$y_{n+1}=y_n+h\Phi(x_n,y_n,h)$$

local truncation error 指的是 $$\tau(h)=y(x_{n+1})-y(x_n)-h\Phi(x_n,y(x_n),h)$$
称方法的阶数为 $p$ 如果 $\tau(h)=O(h^{p+1})$.

global error 指的是 $$e_n=y(x_n)-y_n$$

- Euler's method 阶数为 $1$ $$y_{n+1}=y_n+hf_n$$
- backward Euler method 阶数为 $1$ $$y_{n+1}=y_n+hf(x_{n+1},y_{n+1})$$
- Trapezium method 阶数为 $2$ $$y_{n+1}=y_n+\frac h2(f_n+f_{n+1})$$
- Heun's method 阶数为 $2$ $$y_{n+1}=y_n+\frac h2\left(f_n+f(x_n+h,y_n+hf_n)\right)$$

## Runge-Kutta methods
$$
\begin{aligned}
    k_1 &= f(x_n,y_n)\\
    k_2 &= f(x_n+c_2h,y_n+ha_{21}k_1)\\
    k_i&=f(x_n+c_ih,y_n+h(a_{i1}k_1+\cdots+a_{i,i-1}k_{i-1})),\ i=3:m\\
    y_{n+1} &= y_n+h(b_1k_1+b_2k_2+\cdots+b_mk_m)
\end{aligned}
$$

### 2-stage Runge-Kutta
$$
\begin{aligned}
    k_1 &= f(x_n,y_n)\\
    k_2 &= f(x_n+ch,y_n+hak_1)\\
    y_{n+1} &= y_n+h(b_1k_1+b_2k_2)
\end{aligned}
$$
阶数是 $2$ 当
$$
\begin{aligned}
    b_1+b_2&=1\\
    b_2c&=\frac12\\
    b_2a&=\frac12
\end{aligned}
$$

- $c=1$ 是 Huen's method
- $c=\frac{1}{2}$ 是 explicit midpoint method
- $c=\frac23$ 让局部误差最小

## Linear Multistep Method
$$
y_{n+1}=\sum_{k=1}^l a_ky_{n+1-k}+h\sum_{k=0}^l b_k f_{n+1-k}
$$

### Adams-Bashforth Methods
用 $f_n$ 之前的 $l$ 个值做插值估计 $f$, 阶数为 $l$.

- 1-step 就是 Euler's method $$y_{n+1}=y_n+hf_n$$
- 2-step 阶数为 2 $$y_{n+1}=y_n+\frac{h}{2}(3f_n-f_{n-1})$$
- 3-step $$y_{n+1}=y_{n}+\frac{h}{12}\left(23 f_{n}-16 f_{n-1}+5 f_{n-2}\right)$$
- 4-step $$y_{n+1}=y_{n}+\frac{h}{24}\left(55 f_{n}-59 f_{n-1}+37 f_{n-2}-9 f_{n-3}\right)$$