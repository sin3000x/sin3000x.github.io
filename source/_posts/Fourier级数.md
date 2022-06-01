---
title: Fourier 级数
categories:
  - 数学
  - 分析
  - 级数
mathjax: true
abbrlink: 22351
date: 2022-05-29 11:27:08
---
$$
f\colon[-L,L]\to\mathbb{R}
$$
$$F(x)=a_0+\sum_{n=1}^\infty \left(a_n\cos\left(\frac{n\pi x}{L}\right)+b_n\sin\left(\frac{n\pi x}{L}\right)\right)$$
其中
$$a_0=\frac{1}{2L}\int_{-L}^Lf(x)\,\mathrm{d}x$$
$$a_n=\frac{1}{L}\int_{-L}^Lf(x)\cos\left(\frac{n\pi x}{L}\right)\,\mathrm{d}x$$
$$b_n=\frac{1}{L}\int_{-L}^Lf(x)\sin\left(\frac{n\pi x}{L}\right)\,\mathrm{d}x$$