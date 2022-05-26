---
title: 分部积分的表格法
categories:
  - 数学
  - 微积分
  - 单变量微积分
mathjax: true
abbrlink: 42394
date: 2022-04-23 22:48:32
---
$$\int (x^2+x)\e^{2x}\d x$$
第一行求导, 第二行积分, 直到求导结果为 0:
<img src="/file/xex.png" width="400"/>
正负交替相加:
$$
\text{原式}=\left({x^2+x\over2}-{2x+1\over4}+\frac14\right)\e^{2x}=\frac12 x^2\e^{2x}+C.
$$
<!--more-->

---

若多次求导不能为 0, 需要在最后加一个积分项, 其符号与上一个相反. 比如出现循环:

$$
\int \e^{x}\sin 2x\d x
$$

<img src="/file/sine.png" width="350">

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
<img src="/file/xarctanx.png" width="250">

$$
\text{原式}=(x^2+1)\arctan x-\int 1\d x=(x^2+1)\arctan x-x+C.
$$