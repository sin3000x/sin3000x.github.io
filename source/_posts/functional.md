---
title: 泛函基础
categories:
  - 数学
  - 分析
  - 泛函分析
mathjax: true
abbrlink: 64221;
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
根据定义,
$$
|j(u)|\leq \|j\|_{X^*}\|u\|_X.
$$
$j$ 对 $u$ 的**作用**: $\langle j,u\rangle=j(u)$

> 🌰 给定 $f$, $F(v)=\int_\Omega fv\d x$ 是 $H_0^1(\Omega)$ 的对偶空间中的元素.

**引理: $V\subset W\implies W^*\subset V^*$.**

### Riesz 表示定理
$X^*$ 上的有界线性泛函 $j$ 可以被原空间 $X$ 上的元素 $g$ 表示: $$\langle j,u\rangle=(g,u).$$
且范数相同:$$\|j\|_{X^*}=\|g\|_X.$$
这是说, 任何有界线性泛函的作用都是某个内积.

> 🌰 $L^2(\Omega)$ 上的有界线性泛函 $j(v)=\int_\Omega v\d x$, 实际上就是 $v$ 和常函数 $1$ 的内积.

Rieze 映射 $\mathcal{R}\colon X^*\to X$, $j\mapsto g$ 是一个保距同构. 实际上根据定义,
$$
(\mathcal{R}j,v)=j(v).
$$

## Lebesgue 空间
Lebesgue $p$ 范数: $$\|u\|_{L^p(\Omega)}=\left(\int_\Omega|u|^p\d x\right)^{1\over p}$$

$$\|u\|_{L^\infty(\Omega)}=\mathrm{ess\ sup}\{|u(x)|\colon x\in\Omega\}$$

Lebesgue 空间: $$L^p(\Omega)=\{u\colon\Omega\to\R\colon \|u\|_{L^p(\Omega)}<\infty\}$$

$p$ 越大, 越不能容忍奇点处的发散.

> 取 $\Omega=(0,1)$, 那么 $L^1$ 接受 ${1\over x^{0.99}}$ 而不接受 $\frac 1x$. 前者在 0 处的发散率慢一些.
> 
> $L^2$ 接受 ${1\over x^{0.4999}}$, 而不接受 $1\over\sqrt x$.

*注: $L^p(\Omega)$ 中的元素实际上是函数的等价类, 因为 Lebesgue 积分不区分几乎处处相等的函数.*

**定理: $p\in[1,\infty]$ 的 Lebesgue 空间都是 Banach 空间, $p=2$ 时也是 Hilbert 空间.**

## Sobolev 空间
### 弱导数
这是利用分部积分做的推广, $g$ 是 $f_i'$ 的弱化. 其中 $\phi$ 是任意的测试函数.
$$\int_\Omega g\phi\d x=-\int_\Omega f{\partial\phi\over\partial x_i}\d x,\ \forall\phi\in C_0^\infty(\Omega).$$
其中 $f,g$ 在 $L_{\text{loc}}^1(\Omega)$ 中, 这指的是在 $\Omega^\circ$ 中的任意紧子集上 $L^1$ 可积. 这个集合包括 $L^1(\Omega)$ 和 $C^0(\Omega)$.

弱导数在不区分零测集时唯一.

> 任何**分段可导**的**连续**函数都是弱可导的.

### 多维指标
如果 $\alpha=(\alpha_1,\ldots,\alpha_n)$, 那么 $$\phi^{(\alpha)}=\left(\partial_{x_1}\right)^{\alpha_1}\cdots(\partial_{x_n})^{\alpha_n}\phi.$$
定义 $|\alpha|=\alpha_1+\cdots+\alpha_n$.

### 高阶弱导数
推广 $f^{(\alpha)}$ 为 $D^\alpha f$, 需要存在一个 $g$:
$$\int_{\Omega}g\phi\d x=(-1)^{|\alpha|}\int_{\Omega}fg^{(\alpha)}\d x, \quad\forall\phi\in C_0^\infty(\Omega).$$

### Sobolev 范数
$$
\|f\|_{W_p^k(\Omega)}=\left(\sum_{|\alpha|\leq k}\|D^\alpha f\|_{L^p(\Omega)}^p\right)^\frac1p
$$
$$
\|f\|_{W_\infty^k(\Omega)}=\max_{|\alpha|\leq k}\|D^\alpha f\|_{L^\infty(\Omega)}
$$

### Sobolev 空间
$$W_p^k(\Omega)=\{f\in L_{\text{loc}}^1(\Omega)\colon \|f\|_{W_p^k(\Omega)}<\infty\}$$
是一个 Banach 空间.
$$H^k(\Omega)=W_2^k(\Omega)$$ 是 Hilbert 空间.

它的范数
$$
\|f\|_{H^k}^2=\sum_{|\alpha|\leq k}\|D^\alpha f\|_{L^2}^2
$$
比如 $\|f\|_{H^1}^2=\|f\|_{L^2}^2+\|f'\|_{L^2}^2$.

> $W_p^0(\Omega)=L^p(\Omega)$ 不要求导数.

## Sobolev 不等式
如果有足够的弱导数, 那么函数连续有界:

$\Omega\in\R^n$ 是 Lipschitz 区域, $k$ 是正整数, $p\geq1$. 若有
$$
\begin{gathered}
k\geq n,\quad p=1\\
k>n/p,\quad p>1
\end{gathered}
$$
那么存在常数 $C$ 使得 $\forall u\in W_p^k(\Omega)$,
$$
\|u\|_{L^\infty(\Omega)}\leq C\|u\|_{W_p^k(\Omega)}.
$$
$u$ 的等价类中有一个连续函数.

### $n=1$
只要 $k\geq1$, 换言之只要有一阶弱导数, 就连续.

**定理: 有界区域上的分段光滑函数在 $H^1$ 中 $\iff$ 连续.**

$$H^1\subset C$$

### $n=2$
$$
W_1^1(\Omega)\not\subset C(\Omega),\quad W_1^2(\Omega)\subset C(\Omega)
$$
$$
H^1\not\subset C,\quad H^2\subset C
$$

### $n=3$
$$
W_1^2\not\subset C,\quad W_1^3\subset C
$$
$$
H^2\subset C
$$