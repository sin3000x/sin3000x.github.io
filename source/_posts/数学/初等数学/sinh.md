---
title: 双曲函数
mathjax: true
categories:
  - 数学
  - 初等数学
abbrlink: 12845
date: 2022-03-06 15:17:12
---
## 定义

$$\sinh(x)=\frac{\e^x-\e^{-x}}{2}$$

$$\cosh(x)=\frac{\e^x+\e^{-x}}{2}$$

$$\tanh(x)=\frac{\e^x-\e^{-x}}{\e^x+\e^{-x}},\ \coth(x)=\frac{1}{\tanh(x)}$$

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Sinh_cosh_tanh.svg/440px-Sinh_cosh_tanh.svg.png" width="300" height="300"/>

<!--more-->

## 复变量

$$\sin(\i x)=\i\sinh(x),\ \sinh(\i x)=\i\sin(x)$$

$$\cos(\i x)=\cosh(x),\ \cosh(\i x)=\cos(x)$$

## 和角公式

$$\sinh(x\pm y)=\sinh(x)\cosh(y)\pm\cosh(x)\sinh(y)$$

$$\cosh(x\pm y)=\cosh(x)\cosh(y)\pm\sinh(x)\sinh(y)$$

$$
\tanh(x+y)={\tanh x+\tanh y\over 1+\tanh x\tanh y}
$$

$$
\tanh(x-y)={\tanh x-\tanh y\over 1-\tanh x\tanh y}
$$

## 倍角公式
$$\cosh 2x=\sinh^2x+\cosh^2x=2\sinh^2x+1=2\cosh^2x-1$$

$$\sinh 2x=2\sinh x\cosh x$$

$$\tanh 2x={2\tanh x\over 1+\tanh^2x}$$

## 逆函数

$$\sinh^{-1}(x)=\ln\left(x+\sqrt{x^2+1}\right)$$

$$\cosh^{-1}(x)=\ln\left(x+\sqrt{x^2-1}\right)$$

$$\tanh^{-1}(x)=\frac12\ln\left(\frac{1+x}{1-x}\right)$$

## 导数

$$\begin{gathered}
(\sinh x)'=\cosh x\\
(\cosh x)'=\sinh x\\
(\tanh x)'=\frac{1}{\cosh^2 x}\\
\left(\sinh^{-1}x\right)'=\frac{1}{\sqrt{x^2+1}}\\
\left(\cosh^{-1}x\right)'=\frac{1}{\sqrt{x^2-1}}\\
\left(\tanh^{-1}x\right)'=\frac{1}{1-x^2}\\
\end{gathered}$$

## 积分
$$
\begin{gathered}
\int\sinh(ax)\d x=\frac1a\cosh(ax)+C\\
\int\cosh(ax)\d x=\frac1a\sinh(ax)+C\\
\int\tanh(ax)\d x=\frac{1}{a}\ln(\cosh(ax))+C\\
\int\tan(ax)\d x=-\frac1a\ln|\cos(ax)|+C
\end{gathered}
$$

## 泰勒展开

$$\sinh(x)=x+\frac{x^3}{3!}+\frac{x^5}{5!}+\frac{x^7}{7!}+\cdots$$

$$\cosh(x)=1+\frac{x^2}{2!}+\frac{x^4}{4!}+\frac{x^6}{6!}+\cdots$$