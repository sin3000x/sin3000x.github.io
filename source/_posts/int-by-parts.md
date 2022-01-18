---
title: 高维分部积分
mathjax: true
tags:
  - 数学
  - 分析
  - 微积分
abbrlink: 22001
date: 2022-01-18 21:20:20
---
$$\int_\Omega u\nabla\cdot \boldsymbol{v}\,d\Omega=\int_{\partial\Omega}u\boldsymbol{v}\cdot\boldsymbol{n}\,dS-\int_\Omega\nabla u\cdot\boldsymbol{v}\,d\Omega$$

<!--more-->

对比

$$\int_a^bu v'\,dx=\left.uv\right|_a^b-\int_a^bu'v\,dx$$
特殊情况 (Green's first identity):

$$
\int_\Omega\nabla u\cdot\nabla v\,d\Omega=\int_{\partial\Omega}v\nabla u\cdot\boldsymbol{n}\,dS-\int_\Omega v\nabla^2u\,d\Omega
$$

---

散度乘法法则:

$$\nabla\cdot(u\boldsymbol{v})=u\nabla\cdot \boldsymbol{v}+\nabla u\cdot \boldsymbol{v}$$
