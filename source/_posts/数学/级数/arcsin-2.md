---
title: $\arcsin^2x$的展开式
abbrlink: 20316
mathjax: true
categories:
  - 数学
  - 级数
date: 2021-09-28 21:58:15
---

证明
$$
\arcsin^2x=\frac12\sum_{n=1}^\infty{(2x)^{2n}\over n^2{2n\choose n}}.
$$
<!--more-->

先求导：
$$
(\arcsin^2 x)'={2\arcsin x\over\sqrt{1-x^2}}
$$
利用恒等式$\arcsin x=\arctan\left(x\over\sqrt{1-x^2}\right)$，有
$$
\begin{align*}
{\arcsin x\over\sqrt{1-x^2}}&={1\over\sqrt{1-x^2}}\arctan\left(x\over\sqrt{1-x^2}\right)\\
&=\frac1x\cdot{1\over\sqrt{1-x^2\over x^2}}\arctan\left({1\over\sqrt{1-x^2\over x^2}}\right)\\
&=\left.\frac1x\cdot{1\over\sqrt{1-x^2\over x^2}}\arctan\left({t\over\sqrt{1-x^2\over x^2}}\right)\right|_{t=0}^{t=1}\\
&=\frac1x\int_0^1{\mathrm dt\over t^2+{1-x^2\over x^2}}\\
&=x\int_0^1{\mathrm dt\over 1-x^2+x^2t^2}\\
&=x\int_0^1\sum_{n=0}^\infty(x^2-x^2t^2)^n\,\mathrm dt\\
&=\int_0^1\sum_{n=0}^\infty (1-t^2)^nx^{2n+1}\,\mathrm dt\\
&=\sum_{n=0}^\infty\left(\int_0^1(1-t^2)^n\,\mathrm dt\right) x^{2n+1}\\
&=\sum_{n=0}^\infty{(2n)!!\over(2n+1)!!}x^{2n+1}.
\end{align*}
$$
其中我们利用了[结论](/posts/46715/index.html)。

于是积分：
$$
\begin{align*}
\arcsin^2x&=\int_0^x(\arcsin^2t)'\,\mathrm dt\\
&=2\int_0^x{\arcsin t\over\sqrt{1-t^2}}\,\mathrm dt\\
&=2\int_0^x\sum_{n=0}^\infty{(2n)!!\over(2n+1)!!}t^{2n+1}\,\mathrm dt\\
&=2\sum_{n=0}^\infty{(2n)!!\over(2n+1)!!}\int_0^x t^{2n+1}\,\mathrm dt\\
&=2\sum_{n=0}^\infty{(2n)!!\over(2n+1)!!}\cdot{x^{2n+2}\over2n+2}\\
&=2\sum_{n=0}^\infty{(2^nn!)^2\over(2n+1)!}\cdot{x^{2n+2}\over2n+2}\\
&=2\sum_{n=0}^\infty{2^{2n}(n!)^2\over(2n+2)!}x^{2n+2}\\
&=2\sum_{n=0}^\infty{2^{2n+2}\left((n+1)!\right)^2\over2^2(n+1)^2(2n+2)!}x^{2n+2}\\
&=\frac12\sum_{n=0}^\infty{(2x)^{2n+2}\over(n+1)^2{2n+2\choose n+1}}\\
&=\frac12\sum_{n=1}^\infty{(2x)^{2n}\over n^2{2n\choose n}}.
\end{align*}
$$
