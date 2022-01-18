---
title: '计算定积分'
abbrlink: 45803
date: 2021-09-10 10:54:58
tags:
- 数学
- 微积分
mathjax: true
---

计算
$$
\int_0^1{\ln\left(x+\sqrt{1-x^2}\right)\over x}\,\mathrm dx.
$$
<!--more-->

---

## 方法一 （Feynman's Trick）

定义
$$
I(a)=\int_{0}^{1} \frac{\ln \left(a x+\sqrt{1-x^{2}}\right)}{x}\,\mathrm d x,
$$
那么
$$
\begin{align*}I^{\prime}(a)&=\int_0^1{x\over ax+\sqrt{1-x^2}}\frac1x\,\mathrm dx\\
&=\int_{0}^{1} \frac{\mathrm d x}{a x+\sqrt{1-x^{2}}}\\
&=\int_0^{\frac\pi2}{\cos t\over a\sin t+\cos t}\,\mathrm dt
\\&=: I\end{align*}
$$
定义
$$
J=\int_0^{\frac\pi2}{\sin t\over a\sin t +\cos t}\,\mathrm dt,
$$
组合积分法：
$$
I+aJ=\int_0^\frac\pi2{a\sin t+\cos t\over a\sin t +\cos t}\,\mathrm dt=\frac\pi2
$$

$$
\begin{align*}
aI-J&=\int_0^\frac\pi2{a\cos t-\sin t\over a\sin t+\cos t}\,\mathrm dx\\
&=\int_0^\frac\pi2{\mathrm d(a\sin t+\cos t)\over a\sin t+\cos t}\\
&=\left.\ln(a\sin t+\cos t)\right|_0^\frac\pi2\\
&=\ln a
\end{align*}
$$

解得 (Cramer法则)
$$
\begin{align*}
I&={\begin{vmatrix}\frac\pi2&a\\\ln a&-1\end{vmatrix}\over\begin{vmatrix}1&a\\a&-1\end{vmatrix}}\\&=\frac{1}{1+a^{2}}\left(\frac{\pi}{2}+a \ln a\right).
\end{align*}
$$
此外，
$$
\begin{align*}I(0)&=\int_0^1{\ln\sqrt{1-x^2}\over x}\,\mathrm dx\\&=\int_0^1{\ln\sqrt{1-t}\over\sqrt{t}}{\mathrm dt\over 2
\sqrt t}&&\text{by $x^2=t$}\\&=\frac14\int_0^1{\ln(1-t)\over t}\,\mathrm dx\\&=-\frac14\int_0^1\sum_{n=1}^\infty{x^{n-1}\over n}\,\mathrm dx&&\text{by Taylor Series}\\
&=-\frac14\sum_{n=1}^\infty\frac1n\int_0^1x^{n-1}\,\mathrm dx\\&=-\frac14\sum_{n=1}^\infty\frac{1}{n^2}\\&=-\frac{\pi^2}{24},\end{align*}
$$
于是
$$
\begin{align*}\text{原积分}&=I(1)\\&=I(0)+\int_0^1I'(a)\,\mathrm da\\
&=-\frac{\pi^2}{24}+\int_0^1\frac{1}{1+a^{2}}\left(\frac{\pi}{2}+a \ln a\right)\,\mathrm da\\
&=-\frac{\pi^2}{24}+\frac{\pi}{2}\int_0^1\frac{1}{1+a^{2}}\,\mathrm dx+\int_0^1\frac{a}{1+a^{2}}\ln a\,\mathrm da\\
&=-\frac{\pi^2}{24}+\frac\pi2\cdot\frac\pi4+
\int_0^1\sum_{n=0}^\infty(-1)^na^{2n+1}\ln a\,\mathrm da\\
&=\frac{\pi^2}{12}+\sum_{n=0}^\infty{(-1)^{n+1}\over(2n+2)^2}\\
&=\frac{\pi^2}{12}-\frac14\sum_{n=1}^\infty{(-1)^{n}\over n^2}\\
&=\frac{\pi^2}{12}-\frac14\cdot\frac{\pi^2}{12}\\
&=\frac{\pi^2}{16}.\end{align*}
$$
*注：积分号下求导、积分与求和换序需要有定理保障.*

---

## 方法二（Feynman's Trick）

$$
I=\int_0^1{\ln(x+\sqrt{1-x^2})\over x}\,\mathrm dx
=\int_0^1{\ln \left[x\left(1+{\sqrt{1-x^2\over x^2}}\right)\right]\over x}\,\mathrm dx
$$

故作代换$t=\sqrt{1-x^2\over x^2}$, 那么$x=\frac{1}{\sqrt{1+t^2}}$, $\mathrm dx=-t(1+t^2)^{-\frac32}\,\mathrm dt:$
$$
\begin{align*}
I&=\int_0^\infty{\ln\left[(1+t^2)^{-\frac12}(1+t)\right]\over(1+t^2)^{-\frac12}}\cdot t(1+t^2)^{-\frac32}\,\mathrm dt\\
&=\int_0^\infty{t\ln\left({1+t\over\sqrt{1+t^2}}\right)\over 1+t^2}\,\mathrm dt\\
&=\frac12\int_0^\infty{t\ln\left({(1+t)^2\over{1+t^2}}\right)\over 1+t^2}\,\mathrm dt\\
&=\frac12\int_0^\infty{t\ln\left(1+{2t\over 1+t^2}\right)\over 1+t^2}\,\mathrm dt\\
\end{align*}
$$
定义
$$
I(a)=\frac12\int_0^\infty{t\ln\left(1+{2at\over 1+t^2}\right)\over 1+t^2}\,\mathrm dt,
$$
那么
$$
\begin{align*}I'(a)&=\frac12\int_0^\infty {t\over 1+t^2}\cdot{1\over 1+{2at\over 1+t^2}}\cdot{2t\over 1+t^2}\,\mathrm dt\\
&=\int_0^\infty{t^2\over(t^2+1)(t^2+2at+1)}\,\mathrm d t\\
&=\frac{1}{2a}\int_0^\infty\left({t\over t^2+1}-{t\over t^2+2at+1}\right)\,\mathrm dt\\
&=\frac{1}{2a}\int_0^\infty\left(\frac12\cdot{\mathrm d(t^2+1)\over t^2+1}-\frac12\cdot{\mathrm d(t^2+2at+1)\over t^2+2at+1}+{a\over t^2+2at+1}\,\mathrm dt\right)\\
&=\frac{1}{4a}\left.\ln({t^2+1\over t^2+2at+1})\right|_{t=0}^\infty+\frac12\int_0^\infty{1\over(t+a)^2+1-a^2}\,\mathrm dt\\
&=0+\frac12\cdot{1\over1-a^2}\int_0^\infty{1\over1+\left({t+a\over\sqrt{1-a^2}}\right)^2}\,\mathrm dt\\
&=0+\frac12\cdot{1\over\sqrt{1-a^2}}\int_0^\infty{1\over1+\left({t+a\over\sqrt{1-a^2}}\right)^2}\,\mathrm d\left(t+a\over\sqrt{1-a^2}\right)\\
&={1\over 2\sqrt{1-a^2}}\left.\arctan\left(t+a\over\sqrt{1-a^2}\right)\right|_{t=0}^\infty\\
&={\frac\pi2-\arctan\left(a\over\sqrt{1-a^2}\right)\over2\sqrt{1-a^2}}\\
&={\arctan\left(\sqrt{1-a^2}\over a\right)\over 2\sqrt{1-a^2}}
\end{align*}
$$
且$I(0)=0$, 于是
$$
\begin{align*}\text{原积分}&=I(1)\\&=I(0)+\int_0^1 I'(a)\,\mathrm da\\
&=\int_0^1{\arctan\left(\sqrt{1-a^2}\over a\right)\over 2\sqrt{1-a^2}}\,\mathrm da\\
&=\int_0^\frac\pi2{\arctan({\sin x\over\cos x})\over 2\sin x}\sin x\,\mathrm dx\\
&=\int_0^\frac\pi2\frac x2\,\mathrm dx\\
&={\pi^2\over16}.
\end{align*}
$$
