---
title: 分部积分的表格法
categories:
  - 数学
  - 微积分
tags:
  - 分部积分
mathjax: true
abbrlink: 42394
date: 2022-04-23 22:48:32
---
分部积分的计算非常令人头疼，尤其是涉及到多次分部的时候。表格法提供了一种简记的方法：原理没变，只是避免了繁琐地写积分号的过程。

表格由两行组成，以被积函数的两个因子开头。第一行反复求导, 第二行反复积分, 直到求导结果为 0，表格结束。重点是要识别哪个因子被求导，哪个被积分。

以
$$\int (x^2+x)\e^{2x}\d x$$为例，表格是这样的：
<img src="https://s2.loli.net/2023/04/10/xVmTu5dts2BYbiz.png" width="400"/>
按照箭头的指示，将表格中的内容对应相乘，再按正负符号交替求和:
$$
\text{原式}=\left({x^2+x\over2}-{2x+1\over4}+\frac14\right)\e^{2x}=\frac12 x^2\e^{2x}+C.
$$
<!--more-->

---

若多次求导不能为 0, 需要在最后加一个积分项, 其符号与上一个相反. 比如出现循环:

$$
\int \e^{x}\sin 2x\d x
$$

<img src="https://s2.loli.net/2023/04/10/ncKTFZXA7aC1Bh2.png" width="350">

$$
\int \e^x\sin 2x\d x=(\sin 2x-2\cos 2x)\e^x-4\int\e^{x}\sin 2x\d x,
$$

那么
$$
\text{原式}=\frac15(\sin 2x-2\cos2x)\e^x+C.
$$

---

或者积分被简化:
$$
\int 2x\arctan x\d x
$$
<img src="https://s2.loli.net/2023/04/10/JU8dYOS7uIlbwQ5.png" width="250">
$$
\text{原式}=(x^2+1)\arctan x-\int 1\d x=(x^2+1)\arctan x-x+C.
$$