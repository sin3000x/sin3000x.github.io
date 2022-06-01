---
title: 留数的计算方法
mathjax: true
categories:
  - 数学
  - 分析
  - 复变函数
abbrlink: 51485
date: 2022-04-20 20:09:01
---
1. 在分式 $f=g/h$ 中, 若分母有简单零点 $z_0$ 而分子没有, 那么 $f$ 在 $z_0$ 处的留数为
$$
\frac{g(z_0)}{h'(z_0)}
$$

> $\dfrac{1}{z^4-1}$ 在 $\i$ 处的留数为 $${1\over \left.4z^3\right|_{z=\i}}={1\over-4\i}=\frac\i4.$$

2. 假设 $z_0$ 是 $n$ 阶极点, 那么该点处的留数为
$$
    \frac{1}{(n-1)!}\left(\left(\frac{\d}{\d z}\right)^{n-1}(z-z_0)^n f(z)\right)_{z=z_0}
$$