---
title: Time Series
categories:
    - 数学
    - 统计
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

ACVF: $$\gamma_X(h)=\gamma_X(t+h,t)$$

ACF (Autocorrelation Function): $$\rho_X(h)=\gamma_X(h)/\gamma_X(0)$$

Differencing:

- $\nabla X_t=X_t-X_{t-1}$
- $\nabla^2 X_t=X_t-2X_{t-1}+X_{t-2}$
