---
title: PCA
categories:
  - 计算机
  - 机器学习
mathjax: true
abbrlink: 4593
date: 2022-09-12 11:03:06
---
"降维" 是减少数据特征, 不是减少样本.

<!--more-->

设 $X\in\R^{N\times d}$ 是 $d$ 维的数据矩阵
$$
X=
\begin{bmatrix}
x_{11} & \cdots & x_{1d}\\
x_{21} & \cdots & x_{2d}\\
\vdots & \ddots & \vdots\\
x_{N1} & \cdots & x_{Nd}
\end{bmatrix},
$$
其中 $d$ 是特征个数, $N$ 是样本个数. 希望把它降到 $k$ 维.

## 例子

设只有两个特征 $a$ 和 $b$.
$$
X=\begin{bmatrix}
a_1 & b_1\\
a_2 & b_2\\
\vdots & \vdots\\
a_N & b_N\\
\end{bmatrix},
$$
那么
$$
\frac1N X^TX=\begin{bmatrix}
\frac1N \sum a_i^2 & \frac 1N \sum a_ib_i\\
\frac1N \sum a_ib_i & \frac 1N\sum b_i^2
\end{bmatrix}.
$$
对数据归一化之后, 两个特征里所有样本的均值为 0. 那么
$$
\frac1N X^TX=\begin{bmatrix}
\mathrm{Cov}(a,a) & \mathrm{Cov}(a,b)\\
\mathrm{Cov}(b,a) & \mathrm{Cov}(b,b)
\end{bmatrix}
$$
是协方差阵.

## 步骤

1. 对数据进行归一化. (便于计算协方差阵)
2. 计算协方差矩阵 $X^TX= A\in\R^{d\times d}$. (实际上差一个常数, 但不影响)
3. 特征值分解 $A=Q\Lambda Q^T$.
4. 取前 $k$ 个主导特征向量组成 $Q_k\in\R^{d\times k}$.
5. 把 $X$ 投影成了新矩阵 $XQ_k\in\R^{N\times k}$.