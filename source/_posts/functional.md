---
title: 泛函基础
tags:
  - 数学
  - 分析
  - 泛函分析
mathjax: true
abbrlink: 64221
date: 2022-01-21 13:22:56
---
## Banach 空间
一个完备的赋范空间.

> 🌰 欧式空间装备了 $p$ 范数.

<!--more-->

## Hilbert 空间
一个完备的内积空间.

> 🌰 欧式空间装备了 $(u,v)_{\R^n}=u^Tv$.
> 
> 🌰 平方可积的函数空间装备了$$(u,v)_{L^2(\Omega)}=\int_\Omega uv\d x$$

- $H_0^1(\Omega)$: 平方可积, 边界为0, 导数平方可积的函数空间, 装备了 $$(u,v)_{H_0^1(\Omega)}=\int_\Omega \nabla u\cdot \nabla v\d x$$
- $H(\mathrm{div}, \Omega)$: 平方可积, 散度平方可积的(向量值)函数空间, 装备了 $$(u,v)_{H(\mathrm{div,\Omega})}=\int_\Omega u\cdot v+\nabla\cdot u\nabla\cdot v\d x$$
- $H(\mathrm{curl}, \Omega)$: 平方可积, 旋度平方可积的(向量值)函数空间, 装备了 $$(u,v)_{H(\mathrm{curl,\Omega})}=\int_\Omega u\cdot v+\nabla\times u\cdot\nabla\times v\d x$$

### 线性泛函
一个映射 $j\colon X\to\R$ (把 Hilbert 空间中的函数变成数), 满足 $$j(\alpha u+\beta v)=\alpha j(u)+\beta j(v)$$

> 🌰 在给定区间上积分; 在给定点取值; 在给定点求方向导数

有界线性泛函: 存在 $L\in[0,\infty)$ 使得 $$|j(u)|\leq L\|u\|_X,\quad\forall u\in X.$$

**引理: 有界性$\iff$连续性.**

### 对偶空间
一个 Hilbert 空间 $X$ 的对偶空间 $X^*$ 是所有有界线性泛函的集合, 装备了范数$$\|j\|_{X^*}=\sup_{\|u\|_X=1}|j(u)|,$$ 也是一个 Hilbert 空间.

$j$ 对 $u$ 的**作用**: $\langle j,u\rangle=j(u)$

> 🌰 给定 $f$, $F(v)=\int_\Omega fv\d x$ 是 $H_0^1(\Omega)$ 的对偶空间中的元素.

**引理: $V\subset W\implies W^*\subset V^*$.**

### Riesz 表示定理
$X^*$ 上的有界线性泛函 $j$ 可以被原空间 $X$ 上的元素 $g$ 表示: $$\langle j,u\rangle=(g,u).$$
且范数相同:$$\|j\|_{X^*}=\|g\|_X.$$
这是说, 任何有界线性泛函的作用都是某个内积.

> 🌰 $L^2(\Omega)$ 上的有界线性泛函 $j(v)=\int_\Omega v\d x$, 实际上就是 $v$ 和常函数 $1$ 的内积.

## Lebesgue 空间
Lebesgue $p$ 范数: $$\|u\|_{L^p(\Omega)}=\left(\int_\Omega|u|^p\d x\right)^{1\over p}$$

$$\|u\|_{L^\infty(\Omega)}=\mathrm{ess\ sup}\{|u(x)|\colon x\in\Omega\}$$

Lebesgue 空间: $$L^p(\Omega)=\{u\colon\Omega\to\R\colon \|u\|_{L^p(\Omega)}<\infty\}$$

*注: $L^p(\Omega)$ 中的元素实际上是函数的等价类.*

> 🌰 $x^{-q}\in L^p((0,1))\iff q<1/p.$

**定理: $p\in[1,\infty]$ 的 Lebesgue 空间都是 Banach 空间, $p=2$ 时也是 Hilbert 空间.**