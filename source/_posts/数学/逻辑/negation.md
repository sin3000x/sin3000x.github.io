---
title: 否定定义
date: '2023-04-18 20:10'
mathjax: true
categories:
  - 数学
  - 逻辑
tags:
  - 极限
abbrlink: 36193
---
高数中的一些定义涉及了复杂的逻辑，这里梳理一下应该怎么否定它们。

<!--more-->

## 准备工作

### 蕴含的否定
首先需要解决的是【$A\implies B$】的否定是什么，答案是【$A\land\lnot B$】。因为这样就恰好否定了蕴含的逻辑：前提和结论的否定同时出现，就说明前提推不出结论。

> 【**如果**我在北京，**那么**我在中国】的否定是【我在北京，**并且**我不在中国】
> 
> 【**如果**今天下雨，**那么** $1+1=2$】的否定是【今天下雨，**并且** $1+1\ne2$】

怎么强调都不过分：【如果……，那么……】的否定不再是这个句式，而是【……，并且不……】。更多的逻辑分析写在了[这里](/posts/31827/index.html)。

### 全称、存在量词的否定

这里的逻辑高中接触过，要否定【对于任意】的命题，说明【存在】一个反例就好；要否定【存在】的命题，需要说明【对于任意】都不成立。

> 【所有的猪都不会飞】的否定是【存在一头猪会飞】
> 
> 【存在一个属猫的人】的否定是【任何人都不属猫】

用逻辑的语言：

- 【$\forall x\in A,\ p(x)$】的否定是【$\exists x\in A,\ \lnot p(x)$】
- 【$\exists x\in A,\ p(x)$】的否定是【$\forall x\in A,\ \lnot p(x)$】

## 极限

### 函数极限

首先我们否定 $\lim_{x\to a}f(x)=L$。把它写成定义：$$\boxed{\forall\varepsilon>0,\ \exists\delta>0,\ \forall x\in\R,\ 0<|x-a|<\delta\implies |f(x)-L|<\varepsilon}.$$也就是说，只要 $x$ 离 $a$ 足够近，就可以让 $f(x)$ 离 $L$ 任意接近。

> 注意：我们把后半部分写成了一个蕴含的逻辑：它通常被表述为【对于任意满足 $0<|x-a|<\delta$ 的 $x$，都有 $|f(x)-L|<\varepsilon$】。

按照上面的分析，它的否定【$f(x)$ 在 $a$ 处不以 $L$ 为极限】就是：$$\boxed{\exists\varepsilon>0,\ \forall\delta>0,\ \exists x\in\R,\ 0<|x-a|<\delta~\text{并且}~|f(x)-L|\ge\varepsilon}.$$也就是说，不管离 $a$ 多近，总能找到 $x$，使得 $f(x)$ 离 $L$ 有一个正距离。

> 注意：这个否定既包括了 $f(x)$ 在 $a$ 处的极限不是 $L$，也包括了 $f(x)$ 在 $a$ 处极限不存在。

> 在反证法中，我们通常通过这个条件找矛盾。由于这里的 $\delta$ 是任取的，我们让它越来越小（同时 $x$ 越来越接近 $a$），还能总满足 $|f(x)-L|\ge\varepsilon$ 就会出问题。只要取一列趋于 0 的 $\delta_n$，就会让 $x\to a$。通常我们显式地取 $\delta_n=\frac1n$，因为这是最简单的趋于 0 的数列。

### 数列极限

接下来我们否定 $\lim_{n\to\infty} a_n=a$，和上面本质上是一样的：$$\boxed{\forall\varepsilon>0,\ \exists N\in\mathbb{N},\ \forall n\in\mathbb{N},\ n\ge N\implies |a_n-a|<\varepsilon}.$$否定：$$\boxed{\exists\varepsilon>0,\ \forall N\in\mathbb{N},\ \exists n\in\mathbb{N},\ n\ge N~\text{并且}~|a_n-a|\ge\varepsilon}.$$

### 升级版


这次我们否定【数列 $\{a_n\}$ 收敛】。这样就多了一个条件：存在某个数 $a$，让数列收敛到 $a$。$$\boxed{\exists a\in\R,\ \forall\varepsilon>0,\ \exists N\in\mathbb{N},\ \forall n\ge N\implies |a_n-a|<\varepsilon}.$$那么【数列 $\{a_n\}$ 发散】写起来就是：$$\boxed{\forall a\in\R,\ \exists\varepsilon>0,\ \forall N\in\mathbb{N},\ \exists n\ge N,\ \text{使得}~|a_{n}-a|\ge\varepsilon}.$$也就是说，对于任何的实数 $a$，$a_n$ 都不收敛到 $a$。

> 注意：在上面的一行我们把【$\forall n\in\mathbb{N},\ n\ge\mathbb{N}$】简写成了【$\forall n\ge N$】；在下面的一行我们把【$\exists n\in\mathbb{N},\ n\ge N$ 并且】简写成了【$\exists n\ge N$ 使得】。这并不是严谨的逻辑语言，但这样写更为简洁。

## 一致收敛和逐点收敛
函数列 $\{f_n\}$ 一致收敛到 $f$ 的定义是$$\boxed{\forall\eps>0,\ \exists N\in\N,\ \forall x\in I,\ \forall n>N\implies |f_n(x)-f(x)|<\eps}.$$否定是（按逻辑写好定义后，否定可以机械地写出来）$$\boxed{\exists\eps>0,\ \forall N\in\N,\ \exists x\in I,\ \exists n>N~\text{使得}~|f_n(x)-f(x)|\ge\eps}.$$也就是说，不管取了多靠后的一项 $f_n$，总有一个点 $x$ 让 $f_n(x)$ 跑出 $f(x)$ 的邻域。

---

逐点收敛的定义是$$\boxed{\forall x\in I,\ \forall\eps>0,\ \exists N\in\N,\ \forall n>N\implies |f_n(x)-f(x)|<\eps}.$$否定是$$\boxed{\exists x\in I,\ \exists\eps>0,\ \forall N\in\N,\ \exists n>N~\text{使得}~|f_n(x)-f(x)|\ge\eps}.$$这是说，存在着一个点 $x$，在此处 $f_n(x)$ 不收敛到 $f(x)$。