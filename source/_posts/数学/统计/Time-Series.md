---
title: Time Series
categories:
  - 数学
  - 统计
mathjax: true
abbrlink: 23857
date: 2022-08-04 19:57:55
---

## type

- exploratory analysis
- autocorrelation analysis
- spectral analysis

<!--more-->

## approach

- plot and see if there is ...
  - a trend
  - a seasonal component 标准循环
  - any apparent sharp change
  - any outlying observation
  - $$\text{Observed}=\text{Trend}+\text{Cyclic}+\text{Irregular}$$
- remove trend and seasonal to get **stationary** residual
- choose a model to fit the residual

## Definitions

$$\mu_X(t):= E[X_t]$$
$$\gamma_X(r,s):= \mathrm{Cov}(X_r,X_s)$$
weakly stationary:

- 均值恒定: $\mu_X(t)$ is independent of $t$.
- 协方差可以平移: $\gamma_X(t+h,t)$ is independent of $t$ for each $h$.

ACVF (AutoCoVariance function): $$\gamma_X(h)=\gamma_X(t+h,t)$$

ACF (AutoCorrelation Function): $$\rho_X(h)=\gamma_X(h)/\gamma_X(0)$$

Differencing:

- $\nabla X_t=X_t-X_{t-1}$
- $\nabla^2 X_t=X_t-2X_{t-1}+X_{t-2}$

## How to check?
ADF test.

## Models
AR, MA, ARMA 都需要平稳; ARIMA 不需要.

### Autoregressive process of order $p$: AR(p)
$$\phi(B)X_t=Z_t$$
来源于前值.

ACF tail off, PACF cut off

### Moving-average process of order $q$: MA(q)
$$X_t=\theta(B)Z_t$$
来源于误差.

ACF cut off, PACF tail off

### ARMA(p, q)
$$\phi(B)X_t=\theta(B)Z_t$$

### ARIMA(d, p, q)
$$\phi(B)(1-B)^dX_t=\theta(B)Z_t$$