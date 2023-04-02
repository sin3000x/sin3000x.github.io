---
title: 定积分性质例题
mathjax: true
categories:
  - 数学
  - 微积分
abbrlink: 5066
date: 2021-09-10 18:09:49
---

**问题：在 $[0,\pi]$ 上的连续函数 $f$ 满足**
$$
\int_0^\pi f(x)\sin x\,\mathrm dx=\int_0^\pi f(x)\cos x\,\mathrm dx=0,
$$
**证明 $f$ 在 $(0,\pi)$ 内至少有两个零点.**

<!--more-->

**证明:**

不妨设 $f$ 不恒为 0. 

若 $f(x)$ 在 $(0,\pi)$ 内无零点, 则不变号, 不妨设 $f(x)>0$. 此时$$f(x)\sin x>0,\forall x\in(0,\pi)\implies\int_0^1f(x)\sin x\,\mathrm dx>0,$$ 与条件矛盾. 于是 $f(x)$ 在 $(0,\pi)$ 上变号, 至少有一个零点.

若只有一个变号零点 $x_0\in(0,\pi)$, 不妨设在 $(0,x_0)$ 上 $f(x)>0$, $(x_0,\pi)$ 上 $f(x)<0$. 那么
$$
F(x)=f(x)\sin(x-x_0)\leq0,~\forall x\in(0,\pi).
$$
又因为
$$
\begin{align*}\int_0^\pi F(x)\,\mathrm dx&=\cos x_0\int_0^\pi f(x)\sin x\,\mathrm dx-\sin x_0\int_0^\pi f(x)\cos x\,\mathrm dx\\
&=\cos x_0\cdot0-\sin x_0\cdot 0\\
&=0,
\end{align*}
$$
故 $F(x)\equiv0$, 于是 $f(x)\equiv0,~\forall x\in(0,\pi)$, 矛盾.

于是 $f(x)$ 在 $(0,\pi)$ 上至少有两个零点.
