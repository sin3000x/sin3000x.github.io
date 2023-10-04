---
title: 整数规划建模
date: '2023-10-01 13:46'
mathjax: true
tags:
  - 运筹
  - 数学规划
  - 整数规划
categories:
  - 数学
  - 运筹优化
abbrlink: 53868
---
整数规划非常有技巧性，本文简单总结逻辑约束、非线性约束的线性化技巧。

不加说明的 $M$ 指一个足够大的正数，$B$ 指集合 $\{0,1\}$。

<!--more-->
## 二选一约束

想保证以下两个约束至少成立一个：$$
\begin{gathered}f(x_1, x_2, \ldots, x_n)\leq0\\
g(x_1, x_2, \ldots, x_n) \leq 0
\end{gathered}
$$可以引入 0-1 变量 $y$，并约束$$
\begin{aligned}f(x_1, x_2, \ldots, x_n)&\leq My \\
g(x_1, x_2, \ldots, x_n) &\leq M(1-y)
\end{aligned}
$$
在 Gurobi 中，要实现 $y=\mathrm{and}(x_1, x_2, x_3)$, 可以写
```python
model.addGenConstrAnd(y, [x1, x2, x3])
```
或利用重载运算符：
```python
model.addConstr(y == and_([x1, x2, x3]))
```

```python
model.addConstr(y == and_(x1, x2, x3))
```

对于 or 同理。

## 指示约束

想加入约束：$$
f(\vx) >0 \implies g(\vx)\geq0,
$$可以引入 0-1 变量 $y$，并约束$$
\begin{align*}
-g(\vx) &\leq My\\
f(\vx) &\leq M(1-y)
\end{align*}
$$
这是因为 $f(\vx)>0$ 时保证了 $y=0$，进而 $-g(\vx)\leq0$。

在 Gurobi 中，可以采用重载运算符实现：
```python
model.addConstr((y == 1) >> (x1 + 2 * x2 + x3 == 1))
```

## 分段函数

若 $y=f(x)$ 是一个分段线性函数，$x$ 轴分段点为 `[0, 2, 3]`，$y$ 轴分段点为 `[1, 4, 3]`，那么在 Gurobi 中可以添加约束：
```python
model.addGenConstrPWL(x, y, [0, 2, 3], [1, 4, 3])
```

对于 $\e^x, \sin x$ 等非线性函数可以通过分段来近似，可以用 `addGenConstrExp` 等方法实现。

## 绝对值

对于任意变量 $x$，我们定义它的正部和负部（注意它们都是非负的）：$$
x^+=\max(0, x)\quad x^-=\max(0, -x).
$$
也就是说，当 $x$ 为正时，$x^+=x,~x^-=0$；当 $x$ 为负时，$x^+=0,~x^-=-x$。此时一个很有用的性质是：$$
|x|=x^++x^-,\quad x=x^+-x^-.
$$
所以，问题$$
\begin{align*}
\min~|x_1|+|x_2|\\
x_1,x_2\in\R
\end{align*}
$$
可以转化为$$
\begin{align*}
\min~&x_1^++x_1^-+x_2^++x_2^-\\
&x_1=x_1^+-x_1^-\\
&x_2=x_2^+-x_2^-\\
&x_1^+,x_1^-, x_2^+, x_2^-\geq0
\end{align*}
$$
在 Gurobi 中，可以使用 `model.addConstr(y == abs_(x))` 来定义绝对值关系。

## 乘积： $\min~ x_1x_2$

### $x_1,x_2\in B$

等价于 $$
\begin{align*}
\min\quad&y\\
\text{s.t.}\quad &y\leq x_1\\
&y\leq x_2\\
&y\geq x_1+x_2-1\\
&x_1, x_2, y\in B
\end{align*}
$$这里 $y$ 也是一个 0-1 变量，是 $x_1, x_2$ 的“与”操作。只有当它们都取 1 时，才会激活 $y\geq1$。

### $x_1\in B, x_2\in [0, u]$

等价于$$
\begin{align*}
\min\quad& y\\
\text{s.t.}\quad& y\leq ux_1\\
& y\leq x_2\\
& y\geq x_2-u(1-x_1)\\
& x_1\in B,~x_2,y\in[0, u]
\end{align*}
$$
这个乘积实际上是逻辑约束，若 $x_1=0$ 那么 $y=0$，若 $x_1=1$ 那么 $y=x_2$。

### $x_1\in B, x_2\in[l, u]$

等价于$$
\begin{align*}
\min\quad &y\\
\text{s.t.} \quad&lx_1\leq y\leq ux_1\\
& y\leq x_2\\
&y\geq x_2-u(1-x_1)\\
&x_1\in B,~x_2\in[l, u],~y\in[0, u]
\end{align*}
$$

### $x_1,x_2\in\R$

## 分式

原问题：$$
\begin{align*}
\min\quad&{\sum\limits_i(c_ix_i+\alpha)\over\sum\limits_i (d_ix_i+\beta)}\\[.5em]
\text{s.t.}\quad&\sum\limits_i a_{ij}x_i\leq b_j\\
&\sum\limits_i d_ix_i+\beta>0\\
&x_i\geq0
\end{align*}
$$
作代换$$y={1\over\sum\limits_i(d_ix_i+\beta)}>0,$$
并进一步 $z_i=x_iy$，可得线性化问题$$
\begin{align*}
\min \quad &\sum\limits_i(c_iz_i+\alpha y)\\
\text{s.t.} \quad &\sum\limits_i a_{ij} z_i \leq b_j y\\
&\sum\limits_i d_iz_i+ \beta y=1\\
&y>0,~ z_i\geq0
\end{align*}
$$

## 最大值/最小值

若有 $z=\max(x, y, 3)$, 可添加约束：$$
\begin{gathered}
x\leq z,~y\leq z,~3\leq z\\
x\geq z-M(1-u_1)\\
y\geq z-M(1-u_2)\\
3\geq z-M(1-u_3)\\
u_1+u_2+u_3\geq1\\
u_1,u_2,u_3\in B
\end{gathered}
$$
意思是说，$z$ 不小于 $x,y,3$ 中的任何一个， 又不大于它们中的至少一个。

在 Gurobi 中，可以利用重载函数 `max_` 或 `min_`：

```python
model.addConstr(y == max_([x1, x2, x3, 10.0]))
```

```python
model.addConstr(y == max_(x1, x2, x3, 10.0))
```
