---
title: Gauss 积分
categories:
  - 数学
  - 分析
  - 微积分
  - 单变量微积分
mathjax: true
abbrlink: 48382
date: 2022-10-04 18:57:32
---

证明
$$
I=\int_{-\infty}^\infty\e^{-x^2}\d x=\sqrt{\pi}.
$$
<!--more-->

## 二重积分（泊松的方法）

$$
\begin{align*}
I^2 &= \left(\int_{-\infty}^\infty\e^{-x^2}\d x\right)\left(\int_{-\infty}^\infty\e^{-y^2}\d y\right) \\
&= \int_{-\infty}^{\infty}\int_{-\infty}^{\infty}\e^{-(x^2+y^2)}\d x\d y
\end{align*}
$$

利用{% post_link polar-spherical 极坐标换元 %}可以得到
$$
\begin{align*}
I^2&=\int_{0}^{2\pi}\int_0^\infty\e^{-r^2}r\d r\d\theta\\
&= 2\pi\int_0^\infty\e^{-r^2}r\d r\\
&= 2\pi\cdot\frac12\int_0^\infty\e^{-r^2}\d(r^2)\\
&= -\pi\cdot\left[\e^{-r^2}\right]_0^\infty\\
&= -\pi\cdot(0-1)\\
&= \pi.
\end{align*}
$$
显然 $I>0$, 于是
$$
I=\sqrt{\pi}.
$$

> 注：其中需要严格证明反常重积分与累次积分是相等的。首先，利用比较判别法说明 $I$ 是绝对收敛的，就可以说明 $I$ 与其柯西主值相等。即
> $$
> I=\lim_{a\to+\infty}I(a)=\lim_{a\to+\infty}\int_{-a}^a\e^{-x^2}\d x.
> $$
> 利用 Fubini 定理可以说明对于 $I(a)$，二重积分与累次积分是相等的。此时积分区域是一个正方形，边长为 $2a$。
>
> 之后，我们利用该正方形的**外接圆**和**内切圆**来用极坐标代换算两个重积分，这两个重积分最终都收敛于 $\sqrt{\pi}$。最后利用夹逼准则说明结果成立。

## 笛卡尔坐标系（拉普拉斯的方法）

由于被积函数是偶函数，可以利用对称性得到
$$
I=2\int_0^\infty\e^{-x^2}\d x,
$$
那么
$$
I^2=4\int_0^\infty\left(\int_0^\infty\e^{-(x^2+y^2)}\d y\right)\d x.
$$
这里关键的代换是在 $y$ 的积分里让 $y=xs$ （此时把 $x$ 看作常数，积分关于 $s$），如果 $x$ 和 $y$ 都可正可负，会让 $s$ 的范围难以确定，所以之前都换成了正的范围。

接下来
$$
\begin{align*}
I^2&=4\int_0^\infty\left(\int_0^\infty\e^{-(x^2+x^2s^2)}x\d s\right)\d x\\
&= 4\int_0^\infty\left(\int_0^\infty\e^{-x^2(1+s^2)}x\d x\right)\d s\\
&= 4\int_0^\infty\left(\frac12\int_0^\infty\e^{-x^2(1+s^2)}\d (x^2)\right)\d s\\
&= 2\int_0^\infty\left(\left.-\frac{1}{1+s^2}\e^{-x^2(1+s^2)}\right|_{x=0}^{x=\infty}\right)\d s\\
&=2\int_0^\infty\frac{1}{1+s^2}\d s\\
&= 2\ \left.\arctan s\right|_0^\infty\\
&=2\times\frac\pi2\\
&= \pi,
\end{align*}
$$
同样 $I=\sqrt\pi$.

> 注：我们同样利用 Fubini 定理保障了积分换序不影响结果。

## Gamma 函数

做变量代换 $x=\sqrt{t}$ 可以得到
$$
I=2\int_0^\infty\e^{-x^2}\d x=2\int_0^\infty\e^{-t}\cdot\frac12t^{-\frac12}\d t=\Gamma\left(\frac12\right).
$$
之后可以利用 Gamma 函数的性质比如

- 余元公式
  $$
  \Gamma(1-z)\Gamma(z)={\pi\over\sin\pi z}
  $$
  中令 $z=\frac12$.

- 倍乘公式
  $$
  \Gamma(2z)={2^{2z-1}\over\sqrt\pi}\Gamma(z)\Gamma\left(z+\frac12\right)
  $$
  中令 $z=\frac12$.

- Beta 函数
  $$
  B(x,y)={\Gamma(x)\Gamma(y)\over\Gamma(x+y)}
  $$
  中令 $x=y=\frac12$，那么
  $$
  \Gamma\left(\frac12\right)=\sqrt {B\left(\frac12, \frac12\right)}.
  $$
  其中
  $$
  \begin{align*}
  B\left(\frac12, \frac12\right)&=\int_0^1x^{-\frac12}(1-x)^{-\frac12}\d x\\
  &=\int_0^{1}(t^2)^{-\frac12}(1- t^2)^{-\frac12}\cdot2t\d t\qquad (x=t^2)\\
  &=2\int_0^1(1-t^2)^{-\frac12}\d t\\
  &=2\left.\arcsin t\right|_0^1\\
  &=\pi.
  \end{align*}
  $$

- 递推公式
  $$
  \Gamma\left(n+\frac12\right)=\Gamma\left(\frac12\right)\times\frac12\times\frac32\times\cdots\times{2n-1\over2}=\Gamma\left(\frac12\right)\cdot{(2n)!\over2^{2n}n!}
  $$
  中令 $n\to\infty$ 并利用 Stirling 公式。

## 积分号下求导

### 法一

令
$$
A(t)=\left(\int_0^t\e^{-x^2}\d x\right)^2,\ B(t)=\int_0^1{\e^{-t^2(1+x^2)}\over1+x^2}\d x
$$
可以得到 $A'(t)=-B'(t)$，其中 $t>0$。之后可以得到
$$
A(t)=B(t)+\frac\pi4,
$$
这个常数是通过让 $t\to0^+$ 得出的。

再让 $t\to+\infty$ 便得到了
$$
\left(\int_0^\infty\e^{-x^2}\d x\right)^2=\frac\pi4.
$$

### 法二

令
$$
F(t)=\int_0^\infty{\e^{-t^2(1+x^2)}\over 1+x^2}\d x,
$$
可得
$$
F'(t)=-I\e^{-t^2}
$$
那么
$$
F(+\infty)-F(0)=\int_0^\infty F'(t)\d t=\int_0^\infty -I\e^{-t^2}\d t=-\frac12I^2,
$$
所以
$$
I^2=2\left(F(0)-F(+\infty)\right)=2\int_0^\infty{1\over1+x^2}\d x=\pi.
$$

## 留数定理（奇葩的方法）

令
$$
f(z)={\e^{-\frac{z^2}{2}}\over 1+\e^{-\tau z}},
$$
其中 $\tau=\sqrt{\pi}(1+\i)$.

这样的取值满足
$$
\begin{equation}\label{shift}
f(z)-f(z+\tau)=\e^{-\frac{z^2}{2}}.
\end{equation}
$$
$f$ 的奇点落在 $y=x$ 上，围道与奇点如图：

![](截屏2022-10-04 21.12.16.png)

由留数定理，可得
$$
\oint_{\gamma_R}f(z)\d z=2\pi\i\cdot\mathrm{Res}\left(f;z=\frac\tau2\right)=\sqrt{2\pi}.
$$
令 $R\to\infty$，只剩下上下两条边对积分有贡献，于是
$$
\begin{align*}
\sqrt{2\pi}&=\int_{-\infty}^\infty f(x)\d x-\int_{-\infty}^\infty f(x+\i\sqrt\pi)\d x\\
&=\int_{-\infty}^\infty f(x)\d x-\int_{-\infty}^\infty f(x+\tau-\pi)\d x\\
&=\int_{-\infty}^\infty f(x)\d x-\int_{-\infty}^\infty f(x+\tau)\d x\\
&=\int_{-\infty}^\infty \left(f(x)-f(x+\tau)\right)\d x\\
\end{align*}
$$
利用性质 $\eqref{shift}$​ 可得
$$
\sqrt{2\pi}=\int_{-\infty}^\infty\e^{-\frac{x^2}{2}}\d x,
$$
再代换 $x=\sqrt 2t$ 即可得 $I=\sqrt\pi$.
