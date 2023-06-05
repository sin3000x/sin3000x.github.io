---
title: 最小二乘法
mathjax: true
categories:
  - 数学
  - 数值分析
tags:
  - 数值线性代数
  - 最小二乘法
  - 矩阵分解
  - 投影
  - 线性方程组
abbrlink: 36991
date: 2022-01-22 20:13:28
---
最小二乘法是为了解决过度约束的方程 $Ax=b$，其中 $A$ 的行数多于列数（一个瘦高型的矩阵）。通常是无解的，问题弱化为求
$$\min\|Ax-b\|_2,$$
其中 $A\in\R^{m\times n}$, $x\in\R^n$, $b\in\R^m$。

<!--more-->

## 投影和正规方程

这实际上是在找 $\range(A)$ 中离 $b$ 最近的向量 $Ax$。从几何上来说，只需要残差 $b-Ax$ 和 $\range(A)$ 垂直。我们要利用 $\range(A)$ 上的[正交投影](/posts/50690/index.html) $P=A(A^TA)^{-1}A^T$，沿着正交于 $\range(A)$ 的方向把 $b$ 投影进 $\range(A)$：$$Pb=Ax.$$<img alt="$\range(A)$ 中的解 $Ax$ 离 $b$ 最近，需要残差 $b-Ax$ 和 $\range(A)$ 垂直" src=https://s2.loli.net/2023/04/11/ZTQuMUVl8exwdik.png  width=70%>


这等价于解**【正规方程】**
$$\boxed{A^TAx=A^Tb},$$
当且仅当 $A$ 满秩时有唯一解 $x=(A^TA)^{-1}A^Tb.$ 可以利用伪逆写成 $x=A^\dagger b.$ 

---

正规方程也可以通过分析的角度得到：设 $$f(x)=\lVert Ax-b\rVert_2^2=(Ax-b)^T(Ax-b)=x^TA^TAx-2b^TAx+b^Tb,$$那么原问题的最小值点对应 $f(x)$ 的最小值点。后者是一个凸函数，那么最小值点对应驻点：$$\nabla f(x)=2A^TAx-2A^{T}b=0\implies A^TAx=A^Tb.$$

## 计算方法

### 解正规方程

用 Gauss 消元法解正规方程是不被推荐的，因为系数矩阵的[条件数](/posts/37593/index.html)很大：$\kappa(A^TA)=\kappa(A)^2$。幸好它是半正定的，我们可以利用 [Cholesky 分解](https://www.bilibili.com/video/BV1Ag411M76G/), 解方程组 $R^TRx=A^Tb$.

> 1. 计算矩阵 $A^TA$ 和向量 $A^Tb$
> 2. 计算 $A^TA$ 的 Cholesky 分解: $A^TA=R^TR$
> 3. 解方程组 $R^Ty=A^Tb$
> 4. 解方程组 $Rx=y$

$A^T\in\R^{n\times m}$, $A\in\R^{m\times n}$, $A^TA$ 正常需要 $2mn^2$ 次运算, 但可以利用对称性减少为 $mn^2$.

$n\times n$ 正定阵的 Cholesky 分解需要 $\dfrac{n^3}{3}$ 次运算.

共需要 $mn^2+\dfrac13 n^3$ 次运算.

### QR 分解

- 记 $A$ 的 thin QR $$A=QR$$ 与 full QR

  $$A=\begin{bmatrix}
      Q\ Q_{\perp}
  \end{bmatrix}
  \begin{bmatrix}
      R\\0
  \end{bmatrix}.$$
  于是
$$
\begin{aligned}
\|Ax-b\|_2&=\left\lVert\begin{bmatrix}
    Q^T\\Q_\perp^T
\end{bmatrix}(Ax-b)\right\rVert_2\\
&=\left\lVert\begin{bmatrix}
    Q^T\\Q_\perp^T
\end{bmatrix}(QRx-b)\right\rVert_2\\
&=\left\lVert\begin{bmatrix}
    R\\0
\end{bmatrix}x-\begin{bmatrix}
    Q^Tb\\Q_\perp^Tb
\end{bmatrix}\right\rVert_2\\
\end{aligned}
$$
当 $Rx=Q^Tb$ 即 $x=R^{-1}Q^Tb$ 时取得最小值, 此时可见 $A^\dagger=R^{-1}Q.$
- 从几何的角度, $A=QR$ 给出了投影算子 $P$ 的基: $P=QQ^T.$ 于是 $QRx=QQ^Tb$, 也得到了 $x=R^{-1}Q^Tb.$

- 从正规方程的角度,

  $$A^TAx=A^Tb\implies R^TQ^TQRx=R^TQ^Tb\implies Rx=Q^Tb,$$
  殊途同归.

> 1. 计算 reduced QR 分解 $A=QR$
> 2. 计算 $Q^Tb$
> 3. 解方程组 $Rx=Q^Tb$

主要计算量在于 QR 分解, 它需要 $2mn^2-\dfrac{2}{3}n^3$ 次运算.

### SVD
$A=U\Sigma V^T$ 也给出了 $P$ 的基: $P=UU^T$, 根据 $U\Sigma V^Tx=UU^Tb$ 可以得到 $x=V\Sigma^{-1}U^Tb$. 此时也得到了 $A^\dagger=V\Sigma^{-1}U^T.$

> 1. 计算 reduced SVD $A=U\Sigma V^T$
> 2. 计算 $U^Tb$
> 3. 解方程组 $\Sigma y=U^Tb$
> 4. 计算 $x=Vy$

其中的方程组比 QR 方法的三角型更容易解, 是对角型的.

---

同样可以利用正规方程: $$A^TAx=A^Tb\implies V\Sigma^TU^TU\Sigma V^Tx=V\Sigma^T U^Tb\implies \Sigma V^Tx=U^Tb$$

计算量主要在于 SVD, 当 $m\gg n$ 时和 QR 差不多, 当 $m\approx n$ 时计算量更大. 典型估计是 $2mn^2+11n^3$ 次运算.

## 伪逆
- $A$ 列满秩: $A^\dagger=(A^TA)^{-1}A^T$
- $A$ 行满秩: $A^\dagger=A^T(AA^T)^{-1}$