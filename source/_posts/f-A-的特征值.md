---
title: $f(A)$的特征值
mathjax: true
abbrlink: 3877
date: 2021-09-09 10:31:27
categories: 
- 数学
- 代数
- 线性代数
---

**引理 (Schur's Lemma): 若$A$是数域$F$上的$n$阶方阵, 且$A$的特征值都在$F$中, 那么$A$与一个上三角阵相似.**

**证明: **

归纳法. 当$n=1$时显然成立: 此时$A$本身是上三角阵.

假设结论对$n-1$阶方阵成立, 且$A\in F^{n\times n}$的特征值都在$F$中. 记特征向量$v_1$对应的特征值是$\lambda_1\in F$, 并把$v_1$扩展为$F^n$的一组基$\mathcal B=(v_1,\ldots,v_n)$. 在这组基下, $A$被相似变换为矩阵$$[A]_\mathcal{B}=\begin{bmatrix}\lambda_1 & *\\ 0 & A_1\end{bmatrix},$$ 其中$A_1\in F^{(n-1)\times (n-1)}$.

<!--more-->

由于相似矩阵有相同的特征多项式, 于是$$\det(xI-A)=\det(xI-[A]_\mathcal B)=(x-\lambda_1)\det(xI-A_1).$$ 又因为$\det(xI-A)$的根都在$F$中, 所以$\det(xI-A_1)$的根也都在$F$中, 这说明$A_1$是特征值都在$F$中的$n-1$阶方阵.

于是根据归纳假设, 存在可逆阵$P\in F^{(n-1)\times(n-1)}$使得$$U=PA_1P^{-1}$$是上三角阵. 那么只需构造可逆阵$$Q=\begin{bmatrix}1&0\\0&P\end{bmatrix},$$便有$$Q[A]_\mathcal B Q^{-1}=\begin{bmatrix}1&0\\0&P\end{bmatrix}\begin{bmatrix}\lambda_1&*\\0&A_1\end{bmatrix}\begin{bmatrix}1&0\\0&P^{-1}\end{bmatrix}=\begin{bmatrix}\lambda_1&*\\0&U\end{bmatrix}$$是上三角阵.

这说明$A$与一个上三角阵相似, 归纳法完成.

*注: 一个更强的结论是Jordan标准型.*

---

**定理: 若$A$是数域$F$上的$n$阶方阵, 且$A$的特征值都在$F$中. $f$是$F$上的多项式, 那么$a$是$f(A)$的特征值$\iff$$a=f(\lambda)$, 其中$\lambda$是$A$的特征值.**

**证明:** 

$(\Longleftarrow)$容易, 略.

$(\Longrightarrow)$根据引理, $A$与一个上三角阵$T$相似:
$$
A=Q^{-1}TQ.
$$
由于$f$是多项式, 那么
$$
f(A)=f(Q^{-1}TQ)=Q^{-1}f(T)Q.
$$
根据上三角阵的性质, $f(T)$也是上三角阵, 且$f(T)$的对角元恰好是$f(\lambda)$, 其中$\lambda$是$T$的对角元.

因为相似矩阵有相同的特征值, 且上三角阵的对角元与其特征值对应, 于是$f(A)$的特征值都是$f(\lambda)$的形式, 其中$\lambda$是$A$的特征值.
