---
title: 微分形式
mathjax: true
categories:
  - 数学
  - 分析
  - 微积分
  - 多元微积分
abbrlink: 12522
date: 2022-01-18 21:47:48
---
0 次形式: $f$

1 次形式: $P\d x+Q\d y+R\d z$

2 次形式: $P\d y\land \d z+Q\d z\land \d x+R\d x\land \d y$

3 次形式: $R\d x\land \d y\land \d z$

<!--more-->

## 运算律
$\d x\land \d x=0$ 等, $\d x\land \d y=-\d y\land \d x$ 等.

## 外微分运算

$$\d f={\partial f\over\partial x}\d x+{\partial f\over\partial y}\d y+{\partial f\over\partial z}\d z$$
$w=P\d x+Q\d y+R\d z$ 时

$$\begin{aligned}
\d w&=(R_y'-Q_z')\d y\land \d z+(P_z'-R_x')\d z\land \d x+(Q_x'-P_y')\d x\land \d y\\
&=
\begin{vmatrix}
\d y\land \d z&\d z\land \d x&\d x\land \d y\\
{\partial\over\partial x} & {\partial\over\partial y} & {\partial\over\partial z}\\
P&Q&R
\end{vmatrix}
\end{aligned}$$

$w=P\d y\land \d z+Q\d z\land \d x+R\d x\land \d y$ 时

$$\d w=(P_x'+Q_y'+R_z')\d x\land \d y\land \d z$$