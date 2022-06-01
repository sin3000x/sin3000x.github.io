---
title: Hesse 矩阵与Jacobi 矩阵
categories:
  - 数学
  - 微积分
  - 多元微积分
abbrlink: 44547
mathjax: true
date: 2022-01-21 17:10:59
---
Hessian 是**数量场**的二阶导: $$H_{i,j}={\partial f\over\partial x_i\partial x_j}$$

Jacobian 是**向量场**的一阶导: $$J_{i,j}={\partial\bm{f_i}\over\partial x_j}$$

二者的关系: Hessian 是数量场梯度的 Jacobian, 即 $H(f)=J(\nabla f)$.

> 🌰 $f(x,y)=x^2+y^2$
> 
> - $H(f)=\begin{bmatrix}2&0\\0&2\end{bmatrix}$
> - $J(\nabla f)=J\left(\begin{bmatrix}
    2x\\2y
\end{bmatrix}\right)=\begin{bmatrix}2&0\\0&2\end{bmatrix}$