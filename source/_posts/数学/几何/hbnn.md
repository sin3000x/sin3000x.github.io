---
title: 双曲神经网络
date: '2023-07-13 21:35'
mathjax: true
tags:
  - 双曲几何
  - 机器学习
  - 深度学习
categories:
  - 数学
  - 几何
abbrlink: 61728
---
欧式空间是符合人们直觉的空间，在这里面做运算也十分方便，在这里构建神经网络也是一种偷懒的做法。然而一些复杂的数据展示出了明显的非欧特征（比如图结构），在欧式空间中研究非常费劲，但在非欧空间中研究就非常简洁。

<!--more-->

比如一棵树的两个实际距离很远的叶子节点，在二维欧式空间（平面）中却看上去离得很近。增加欧式空间的维数可以缓解这个问题，但是有定理证明，要想尽量保持树中的距离，需要非常高维的欧式空间（维数甚至无界）。然而在双曲空间中，只用二维嵌入就可以解决这个问题：庞加莱（Poincaré）圆盘越靠近边界的空间密度越大，看上去有限的一个圆实际上容量很大——它就很适合刻画一棵树。而且，靠近边缘的叶子节点看上去（欧式）距离很近，但在双曲空间中的距离却很远。

之所以不怎么在非欧空间中研究神经网络，是因为很多基础操作（如向量加法、数乘、内积，矩阵-向量乘法）在其中很难写出一个清楚确定的公式来推广。这里我们研究一种简单的空间：有着负常数曲率的空间，即双曲空间。

这篇博客参考 2018 年的论文[^1]，会补充铺垫一些必要的概念。

## 推广距离：庞加莱球

两个点的“距离”定义为，它们之间各种路线的最短长度。

### 欧氏距离

在欧式几何中，这个最短的路线就是连接它们的直线段——因为任何连接它们的曲线都会比这条线段长。但曲线长度又是怎么定义的？

如果一条曲线 $\Gamma$ 足够光滑，可以用参数方程 $\begin{cases} x=x(t) \\ y=y(t) \end{cases}$ 来表示的话，这条曲线的长度就是 $\int_\Gamma\d s$，其中 $$\boxed{\d s=\sqrt{x'(t)^2+y'(t)^2}\d t}.$$

举个例子：从 $(-\frac12, 0)$ 到 $(\frac12, 0)$ 有一条路径是走半圆：
<img src=https://s2.loli.net/2023/07/14/XU4NsAHELoue2Z9.png width=70%>
那我们可以选参数方程 $\begin{cases}x(t)=\frac12\cos t\\ y(t)=\frac12\sin t\end{cases}$，其中 $t\in[0,\pi]$。于是 $$\d s=\sqrt{\left(-\frac12\sin t\right)^{2}+\left(\frac12\cos t\right)^2} \d t=\frac12\d t，$$这条路径的长度就是 $\int_0^{\pi}\frac12\d t=\frac\pi2$。用同样的方法可以算出走直线段的长度是 $1$。

通过一些方法（比如变分法中的欧拉-拉格朗日方程）可以证明，在这个距离定义下，走直线段是最短的。也就是说，不存在比 $1$ 更短的路径长度。

### 双曲距离与庞加莱圆盘

非欧几何就是推广了 $\d s=\sqrt{x'^2+y'^2}\d t$ 这个关系。双曲几何有很多种等价的模型，在我们要讨论的庞加莱圆盘中，这个弧长微元被定义为
$$\begin{equation}\label{eq:dshb}
\boxed{\d s = \frac{2}{1-x^{2}-y^{2}} \sqrt{x'^2+y'^2} \d t}.\end{equation}
$$
整个空间就是一个单位圆，而且可以看出越靠近圆的边界 $\d s$ 越大（因为此时 $x^2+y^2$ 靠近 1）：在欧式空间中看起来一样长的曲线，越靠近边界，它实际上越长。

举个例子：我们算 $(0,0)\to(0,0.01)$ 的直线段长度。一个参数方程是 $\begin{cases}x(t)=0.01t\\ y(t)=0\end{cases}$，其中 $0\leq t\leq1$，可以算出$$
\d s=\frac{2}{1-(0.01t)^2-0^2}\sqrt{0.01^2+0^2}\d t=\frac{0.02}{1-(0.01t)^2}\d t.
$$
于是这条线段的长度就是 $\int_0^1\frac{0.02}{1-(0.01t)^2}\d t\approx0.020$。
<img src=https://s2.loli.net/2023/07/20/inACwyZgGeRQc3b.png width=70% alt="庞加莱圆盘中，越靠近边界，空间密度越大">

我们再算 $(0.98, 0)\to(0.99, 0)$ 的直线段长度。一个参数方程是 $\begin{cases}x(t)=0.98+0.01t\\ y(t)=0\end{cases}$，其中 $0\leq t\leq 1$。它的长度就是$$
\int_0^1\frac{2}{1-(0.98+0.01t)^2}\sqrt{0.01^2}\d t\approx0.698,
$$比靠近圆心的那段看上去一样长的线段长了 30 多倍。

在这个曲线长度的定义下，两个点之间的最短路线就不是线段了——有一条曲线比直着走更短。这条路线不那么显然，不过可以证明，这条路线实际上是穿越这两个点的一个圆弧。

两个点没法确定唯一的一个圆，但这条路线还有一个限制把它确定下来了：它必须和庞加莱圆的边界正交。换句话说，这条圆弧必须垂直地穿入、穿出庞加莱圆的边界。它是欧式空间中“直线”的推广，被称为测地线（geodesic）。

<img src=https://s2.loli.net/2023/07/15/BHWPyAhXjMUiCt6.png width=60% alt="庞加莱圆盘中的“直线”：任何两点之间的最短路就是这种圆弧的一部分">

### 高维推广

庞加莱圆盘是一个二维的双曲空间，我们可以把它推广到高维，核心还是推广弧长微元 $\d s$。

在二维空间中，$\d s^2$ 实际上就是一个二次式。只要我们留意到根号里面的东西是一个关于 $x'$ 和 $y'$ 的二次型，就容易推广了。欧式空间中，$x'^2+y'^2$ 对应的二次型矩阵是单位阵$$\begin{bmatrix}1&0\\ 0&1\end{bmatrix}.$$ 而在庞加莱圆盘中， $\eqref{eq:dshb}$ 根号下的二次型矩阵是$$
\left(\frac{2}{1-x^2-y^2}\right)^2\begin{bmatrix}1&0\\ 0&1\end{bmatrix},
$$注意我们把根号外的常数提进来了。

从而，在 $n$ 维空间中，欧式空间对应的二次型矩阵就是单位阵 $I_n$，而庞加莱球在某点 $\vx$ 的二次型矩阵就是$$
\left(\frac{2}{1-\lVert\vx\rVert^2}\right)^2 I_n.
$$
其中 $\lVert\cdot\rVert$ 是欧式空间中的 [2-范数](https://www.bilibili.com/video/BV1GM4y1c78K)。

### 黎曼几何

双曲几何对 $\d s$ 的推广只是一种特殊的实现。实际上，这个二次型矩阵可以是任何一个对称、正定的矩阵。它所诱导的向量内积被称为黎曼度量，而黎曼几何就是研究装备了黎曼度量的高维曲面（流形）的。

## 推广线性空间：Möbius 运算

如果在庞加莱圆盘下，我们还像欧式线性空间中那样简单地定义向量数乘、加法等，很容易就会让结果跑出这个单位圆。陀螺向量空间（Gyrovector space）是欧式线性空间在双曲几何下的推广，可以保证这些运算结果还在圆盘内。

注意：**线性空间中只需要向量加法和数乘运算**。我们在陀螺向量空间中只需要定义这两种运算，还没有提供向量内积、矩阵-向量乘法这种良好的结构。它们被放在下一节。

一些相对论模型会采用这种空间，保证不管速度怎样相加，都不会超过光速。假定光速为 $c$，那么我们记 $\mathbb{D}_c^n$ 为一个以原点为球心，半径为 $\frac{1}{\sqrt c}$ 的 $n$ 维开球。陀螺向量空间就是在这里面做向量运算的。当光速为 0 时，这个空间就是欧式空间。当光速为 1 时，它就是庞加莱球。

可见陀螺向量空间是对庞加莱球的进一步推广。我们需要的性质是**$c\to0$ 时，这个空间要趋于欧式空间。**

### Möbius 加法

在 $\mathbb D_c^n$ 中，定义两个向量的加法
$$
\boxed{x\oplus_cy=\frac{(1+2c\langle x,y\rangle+c\lVert y\rVert^2)x+(1-c\lVert x\rVert^2)y}{1+2c\langle x,y\rangle+c^2\lVert x\rVert^2\lVert y\rVert^2}}.
$$

当 $c=0$ 时我们就得到了 $x\oplus_0y=x+y$，但更一般地，这种运算既不满足交换律，也不满足结合律。但它确实满足一些性质：

- $x\oplus_c0=0\oplus_c x=x$
- $(-x)\oplus_c x=x\oplus_c(-x)=0$
- $(-x)\oplus_c(x\oplus_c y)=y$

**莫比乌斯减法**被定义为$$\boxed{
x\ominus_cy=x\oplus_c(-y)}.
$$

### Möbius 数乘

取实数 $r$，定义它和向量 $x$ 的数乘$$\begin{equation}\label{eq:rx}\boxed{
r\otimes_c x=\frac{1}{\sqrt c}\tanh\left(r\tanh^{-1}\left(\sqrt c\lVert x\rVert\right) \right) \frac{x}{\lVert x\rVert}}.\end{equation}
$$当 $x=0$ 时，我们补充定义数乘结果为 0 。当 $c\to0$ 时，确实有 $r\otimes_c x\to rx$。它还满足（以下省略下标 $c$）：

- $n$-加法：$n\otimes x=x\oplus x\oplus\cdots\oplus x$
- 数量分配率：$(r+r')\otimes x=r\otimes x\oplus r'\otimes x$
- 数量结合律：$(rr')\otimes x=r\otimes (r'\otimes x)$
- 缩放性：$\frac{|r|\otimes x}{\lVert r\otimes x\rVert}= \frac{x}{\lVert x\rVert}$

### 距离

陀螺向量空间中的向量 $x$ 和 $y$ 之间被黎曼度量诱导的距离为$$
\frac{2}{\sqrt{c}}\tanh^{-1} \left(\sqrt c\lVert -x\oplus_c y \rVert\right),
$$
此处和下文中的 $-x\oplus_c y$ 指的都是 $(-x)\oplus_c y$ 而不是 $-(x\oplus_c y)$。当 $c\to0$ 时，这个距离确实趋于 $2\lVert x-y\rVert$（为了让双曲空间的曲率为 $-1$，通常习惯加一个因子 $2$，这在前面的弧长微元里也有体现）。

## 推广神经网络：在庞加莱球中进行 Möbius 运算

神经网络无非是一些基础操作的复合（矩阵-向量乘法，向量平移，激活函数等），我们将在这一节利用 Möbius 运算推广将这些操作推广到双曲空间。上面关于向量加法和数乘的运算定义很不自然，不过确实有发展历史和几何直觉。这里没法详尽解释，不过可以验证的是它们在庞加莱球中确实非常方便。

比如：在陀螺向量空间中给定点 $x$，给它一个小偏移 $dx$，陀螺线微元 $ds$ 被定义为 $(x+dx)\ominus_c x$。可以计算得到$$
\lVert ds\rVert=\frac{\lVert dx\rVert}{1-c\lVert x\rVert^2},
$$
和我们前面得到的庞加莱球中的曲线微元是一样的（只差了个常数）。

### 指数映射和对数映射

给定曲面上的一个点 $x$ 和沿着这个点的切向量 $v$（位于切平面内），有办法把这个切向量映射成曲面上的一个新的点。怎么做呢？因为这个切平面是 $x$ 处对曲面的局部近似，所以只要沿着 $v$ 走一小步，就近似还在曲面中。再多走几个小步就能把 $v$ 走完，此时的终点比 $x+v$ 更加接近曲面。如果我们不断地减少步长、增加步数，最终的终点就会落在曲面上，走过的路径就是这个曲面上的一条测地线。

这个步骤很像指数函数的思想，联想到$$
\e^x=\lim_{n\to\infty}\left(1+\frac{x}{n}\right)^n
$$的意义就是把 $x$ 这个作用拆成很多小份，再重复这么多次。所以我们把这样把 $v$ 映射到曲面上的映射称为**指数映射**（exponential map）。它被叫做这个名字不是因为有指数函数的形状，只是这个思想可以类比。

在黎曼几何中，给定流形 $\mathcal M$ 上的一个点 $q$ 和一个扰动向量 $v$（位于切空间 $T_q\mathcal M$ 中），指数映射 $\exp_q$ 把 $v$ 映射到 $\mathcal M$（见下图 [^2]）。曲线 $\gamma(t)=\exp_q(tv)$，其中 $0\leq t\leq 1$，是一条连接 $q$ 和 $\exp_q(v)$ 的测地线。在欧式空间中，$\exp_x(v)=x+v$。

<img src="https://s2.loli.net/2023/07/19/Sle1g6fwvt2bDZz.png" alt="指数映射把过 $q$ 的切向量 $v$ 映射到流形上的 $p$">

给定曲面上的点 $x$ 和作用于它的切向量 $v$，可以给出指数映射的一个表达式。欧式空间中的结果有另一种解读：从 $x$ 出发，沿着 $v$ 的方向，以单位速度走过 $\lVert v\rVert$ 的时间到达的地方。这时走过的路径是直线，那么在黎曼几何中就是走测地线。

记黎曼度量诱导的范数为 $\lVert\cdot\rVert_g$，单位化的 $v$（即 $\frac{v}{\lVert v\rVert_g}$）为 $\hat v$，那么在 $0$ 处取值为 $x$、导数为 $\hat v$ 的测地线 $\gamma(t)$ 被称为**单位速度测地线**（unit-speed geodesic）。沿着这条测地线走过时间 $\lVert v\rVert_g$ 就到达了 $v$ 在指数映射下的结果，即 $\exp_x(v)=\gamma(\lVert v\rVert_g)$。

在 $\mathbb{D}_c^n$ 中，可以算出单位速度测地线为$$
\gamma(t)=x \oplus_c\left(\tanh \left(\sqrt{c} \frac{t}{2}\right) \frac{\hat v}{\sqrt{c}\lVert\hat v\rVert}\right).
$$此时有 $$\lVert v\rVert_g=\frac{2}{1-c\lVert x\rVert^2}\lVert v\rVert.$$记其中的因子 $\frac{2}{1-c\lVert x\rVert^2}$ 为 $\lambda_x^c$，于是可以写出指数映射的显示表达：
$$
\boxed{\exp _x^c(v)=x \oplus_c\left(\tanh \left(\sqrt{c} \frac{\lambda_x^c\lVert v\rVert}{2}\right) \frac{v}{\sqrt{c}\lVert v\rVert}\right)}.
$$
**对数映射**（logarithmic map）是它的逆映射，即给定流形上的起点 $x$ 和指数映射后得到的终点 $y$，求那个作用的切向量：
$$\boxed{
\log _x^c(y)=\frac{2}{\sqrt{c} \lambda_x^c} \tanh ^{-1}\left(\sqrt{c}\lVert -x \oplus_c y\rVert\right) \frac{-x \oplus_c y}{\left\lVert-x \oplus_c y\right\rVert}
}.
$$
当 $c\to0$ 时，可以验证 $\exp_x^c(v)=x+v$，$\log_x^c(y)=y-x$。

在后面的推广中，我们主要用 $x$ 在原点处的情形，此时两种运算简化为：$$\boxed{\begin{gather*}\exp_0^c(v)=\tanh\left(\sqrt{c}\lVert v\rVert\right){v\over\sqrt{c}\lVert v\Vert}\\[1em]
\log_0^c(y)=\tanh^{-1}\left(\sqrt{c}\lVert y\rVert\right){y\over \sqrt{c}\lVert y\rVert}\end{gather*}}$$

再强调一下：指数映射从切空间映射到曲面上，对数映射从曲面映射到切空间。

### 向量数乘

利用指数和对数映射，可以得到向量数乘 $\eqref{eq:rx}$ 的一个等价表述：$$\boxed{r\otimes_c x=\exp_0^c\left(r\log_0^c(x)\right)},$$其中 $r$ 是实数，$x$ 是庞加莱球中的向量。这个式子的意义要明显得多：把 $x$ 对数映射到原点处的切空间里，做一个 $r$ 的伸缩，再通过那里的指数映射回到庞加莱球中。

### 一般映射

上面这个式子很有启发性——它首先把 $x$ 映射到了切空间中，也就是我们熟悉的欧式空间。在这里，我们可以做任何熟悉的运算。这种思想便于我们推广一般映射。

给定一个从 $\R^n\to\R^m$ 的映射 $f$，我们可以定义它的 **Möbius 版本**：$$\boxed{f^{\otimes_c}(x)=\exp_0^c\left(f\left(\log_0^c(x)\right)\right)},$$其中 $\log$ 把 $x$ 从 $n$ 维庞加莱球映射到 $n$ 维欧式空间，$f$ 把结果映射到 $m$ 维欧式空间，$\exp$ 再把结果映射到 $m$ 维庞加莱球。所以 $f^{\otimes_c}$ 就是一个从 $\mathbb{D}_c^n$ 到 $\mathbb{D}_m^n$ 的映射。

这样定义确实得到了几个美妙的性质：

- 在 $c\to0$ 时，$f^{\otimes_c}(x)=f(x)$
- 保持态射：$\left(f\circ g\right)^{\otimes_c}=f^{\otimes_c}\circ g^{\otimes_c}$
- 保持方向：$\frac{f^{\otimes_c}(x)}{\lVert f^{\otimes_c}(x)\rVert}=\frac{f(x)}{\lVert f(x)\rVert}$

### 矩阵-向量乘法

这个是 $f$ 为线性映射的特殊情况，即给定一个 $n$ 维向量 $x$，$f(x)=Mx$ 把它变成了一个 $m$ 维向量，其中 $M$ 是一个 $m\times n$ 的矩阵。

利用上面的定义，矩阵-向量乘法的 Möbius 版本为：$$\boxed{\begin{align*}M^{\otimes_c}(x)&=\exp_0^c\left(M\log_0^c(x)\right)\\[1em]
&=\frac{1}{\sqrt c}\tanh\left({\lVert Mx\rVert\over\lVert x\rVert}\tanh^{-1}\left(\sqrt{c}\lVert x\rVert\right)\right){Mx\over\lVert Mx\rVert}\end{align*}}$$当 $Mx=0$ 时补充定义结果为 $0$。我们不妨把 Möbius 矩阵-向量乘法直接定义成这个：$$M\otimes_c x=M^{\otimes_c}x,$$得到的性质为：

- 矩阵结合律：$(AB)\otimes_c x=A\otimes_c(B\otimes_c x)$
- 数量-矩阵结合律：$(rM)\otimes_c x=r\otimes_c(M\otimes_c x)$
- 保持旋转：对正交矩阵 $M$，有 $M\otimes_c x=Mx$


<font size=2>
[^1]: Ganea, O., Bécigneul, G. and Hofmann, T., 2018. Hyperbolic neural networks. *Advances in Neural Information Processing Systems*, 31.

[^2]: Zimmermann, R., 2020. Hermite interpolation and data processing errors on Riemannian matrix manifolds. *SIAM Journal on Scientific Computing*, 42(5), pp.A2593-A2619.
</font>


