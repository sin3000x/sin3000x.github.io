---
title: 分块矩阵的行列式
tags:
  - 数学
  - 线性代数
mathjax: true
abbrlink: 42453
date: 2022-01-14 09:19:05
---

## 结论

设分块矩阵 $\Gamma=\begin{pmatrix}A&B\\C&D\end{pmatrix}$, 那么

- $A$ 可逆时, $\det(\Gamma)=\det(A)\det(D-CA^{-1}B)$
- $D$ 可逆时, $\det(\Gamma)=\det(A-BD^{-1}C)\det(D)$
  
<!--more-->

## 特殊情况

- $\begin{equation}\det\begin{pmatrix}
    A&0\\ C&D
\end{pmatrix}=\det(A)\det(D)\label{lower}\end{equation}$


- $\begin{equation}\label{upper}\det\begin{pmatrix}
    A&B\\ 0&D
\end{pmatrix}=\det(A)\det(D)\end{equation}$

- $\begin{equation}\label{diag}\det\begin{pmatrix}
    A&0\\ 0&D
\end{pmatrix}=\det(A)\det(D)\end{equation}$

- $\begin{equation}\label{commute}\text{当 $CD=DC$ 时, }\det(\Gamma)=\det(AD-BC)\end{equation}$

- $\begin{equation}\label{AB}\det\begin{pmatrix}
  A&B\\B&A  
\end{pmatrix}=\det(A+B)\det(A-B)\end{equation}$

## 证明

先证 $\eqref{lower}$ : 对 $A$ 部分进行(倍加)**行变换**化为下三角阵, 再对 $D$ 部分进行**列变换**化为下三角阵. 这并不影响 $A$ , $D$ 和分块矩阵的行列式, 且都化为了对角线的乘积. 结论显然.

$\eqref{upper}$ 的证明可以通过取转置得到, $\eqref{diag}$ 是一种特殊情况.

对于一般情况, 需要利用
$$\begin{pmatrix}
    A&B\\C&D
\end{pmatrix}\begin{pmatrix}
    I&0\\ -D^{-1}C&I
\end{pmatrix}=\begin{pmatrix}
    A-BD^{-1}C&B\\0&D
\end{pmatrix}.$$
可以把它想成是一种列变换: 把第二列右乘 $-D^{-1}C$ 加到第一列.
两边取行列式并利用 $\det(AB)=\det(A)\det(B)$ 和 $\eqref{upper}$ , 就得到了 $\det(\Gamma)=\det(A-BD^{-1}C)\det(D)$ . 另外一个结论可以利用行变换类似得到.

---

下面证 $\eqref{commute}$ . 注意已知 $CD=DC$.

我们可以利用
$$\begin{pmatrix}
    A&B\\C&D
\end{pmatrix}\begin{pmatrix}
    D&0\\-C&I
\end{pmatrix}=\begin{pmatrix}
    AD-BC&B\\0&D
\end{pmatrix}.$$
两边取行列式就得到了
$$\det(\Gamma)\det(D)=\det(AD-BC)\det(D).$$
如果 $\det(D)\ne0$ , 那么消去 $\det(D)$ 即得结论.

也可以利用开头的结论$$\begin{aligned}
    \det(\Gamma)
    &=\det(A-BD^{-1}C)\det(D)\\
    &=\det(AD-BD^{-1}CD)\\
    &=\det(AD-BD^{-1}DC)\\
    &=\det(AD-BC).\\
\end{aligned}$$

当 $\det(D)=0$ 时, 可以给 $D$ 一个扰动. 也就是说, 我们用 $D_\varepsilon=D+\varepsilon I$ 代替 $D$ , 其中 $D_\varepsilon$ 可逆且 $\varepsilon$ 是可以任意小的正数. 这个结论可以利用特征值的性质证明, 也可以利用关于$\varepsilon$的多项式 $\det(D_\varepsilon)$ 只在有限个点上取 $0$.

不难看到 $D_\varepsilon$ 仍然是与 $C$ 可交换的. 然后利用上面的方法可以得到$$\det(\Gamma)=\det(AD_\varepsilon-BC).$$
令 $\varepsilon\to0$ 便得到了 $\det(\Gamma)=\det(AD-BC).$

这是由于等号右边是关于 $\varepsilon$ 的多项式, 所以连续, 而 $D_0=D$.

---

对 $\eqref{AB}$, 只需要对$$\begin{pmatrix}
    I&0\\-I&I
\end{pmatrix}\begin{pmatrix}
    A&B\\B&A
\end{pmatrix}\begin{pmatrix}
    I&0\\I&I
\end{pmatrix}=\begin{pmatrix}
    A+B&B\\0&A-B
\end{pmatrix}$$两边取行列式.