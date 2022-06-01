---
title: 高维分部积分
mathjax: true
categories:
  - 数学
  - 分析
  - 微积分
  - 多元微积分
abbrlink: 22001
date: 2022-01-18 21:20:20
---
$$\boxed{
\int_\Omega \nabla\cdot \bm u v\d x=\int_{\partial\Omega}v\boldsymbol{u}\cdot\boldsymbol{n}\d s-\int_\Omega\nabla v\cdot\boldsymbol{u}\d x}
$$

$$\boxed{
\int_\Omega(\nabla\times\bm u)\cdot\bm v\d x=\int_\Omega(\nabla\times\bm v)\cdot \bm u\d x+\int_{\partial\Omega}(\bm u\times \bm v)\cdot\bm n\d s}
$$

<!--more-->

特殊情况 (Green's first identity):

$$
\int_\Omega\nabla u\cdot\nabla v\d x=\int_{\partial\Omega}v\nabla u\cdot\boldsymbol{n}\d s-\int_\Omega v\nabla^2u\d x
$$

$$
\int_\Omega(\nabla\times\nabla\times\bm u)\cdot\bm v\d x=\int_\Omega (\nabla\times \bm u)\cdot(\nabla\times\bm v)\d x-\int_{\partial\Omega}(\bm v\times\nabla\times\bm u)\cdot n\d s
$$

---

$\nabla$ 的性质:

$$
\begin{equation}\label{eq:div}
\nabla\cdot(v\boldsymbol{u})=v\nabla\cdot \boldsymbol{u}+\nabla v\cdot \boldsymbol{u}
\end{equation}
$$

$$
\begin{equation}\label{eq:div-cross}
\nabla\cdot(\bm {u}\times \bm{v})=(\nabla\times \bm u)\cdot \bm v-\bm u\cdot(\nabla\times \bm v)
\end{equation}
$$

对 $(\ref{eq:div})$ 和 $(\ref{eq:div-cross})$ 两边积分即得前两个式子. 其中用到了散度定理.

在 $(\ref{eq:div-cross})$ 中取 $\bm v$ 和 $\nabla\times\bm u$ 得到
$$
\nabla\cdot(\bm v\times\nabla\times \bm u)=(\nabla\times\bm v)\cdot(\nabla\times\bm u)-\bm v\cdot(\nabla\times\nabla\times\bm u),
$$
两边积分即得
$$
\int_\Omega(\nabla\times\nabla\times\bm u)\cdot\bm v\d x=\int_\Omega (\nabla\times \bm u)\cdot(\nabla\times\bm v)\d x-\int_{\partial\Omega}(\bm v\times\nabla\times\bm u)\cdot \bm n\d s.
$$

其中根据混合积的性质, 后一项等于
$$
\begin{align*}
\int_{\partial\Omega}\bm n\cdot(\bm v\times\nabla\times\bm u)\d s=\int_{\partial\Omega}\bm v\cdot(\nabla\times\bm u\times \bm n)\d s
\end{align*}.
$$
