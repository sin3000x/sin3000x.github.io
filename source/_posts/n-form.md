---
title: 微分形式
mathjax: true
tags:
  - 数学
  - 微积分
  - 分析
abbrlink: 12522
date: 2022-01-18 21:47:48
---
0次形式: $f$

1次形式: $P\,dx+Q\,dy+R\,dz$

2次形式: $P\,dy\land dz+Q\,dz\land dx+R\,dx\land dy$

3次形式: $R\,dx\land dy\land dz$

<!--more-->

## 运算律
$dx\land dx=0$ 等, $dx\land dy=-dy\land dx$ 等.

## 外微分运算

$$df={\partial f\over\partial x}dx+{\partial f\over\partial y}dy+{\partial f\over\partial z}dz$$
$w=P\,dx+Q\,dy+R\,dz$ 时

$$\begin{aligned}
dw&=(R_y'-Q_z')dy\land dz+(P_z'-R_x')dz\land dx+(Q_x'-P_y')dx\land dy\\
&=
\begin{vmatrix}
dy\land dz&dz\land dx&dx\land dy\\
{\partial\over\partial x} & {\partial\over\partial y} & {\partial\over\partial z}\\
P&Q&R
\end{vmatrix}
\end{aligned}$$

$w=P\,dy\land dz+Q\,dz\land dx+R\,dx\land dy$ 时

$$dw=(P_x'+Q_y'+R_z')dx\land dy\land dz$$