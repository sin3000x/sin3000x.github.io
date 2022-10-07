---
title: Boosting
categories:
  - 数学
mathjax: true
typora-root-url: ./
abbrlink: 1458
date: 2022-10-02 09:50:39
---

## Adaptive Boosting

 先训练第一个模型，增加预测错误的样本的权重，并减小预测正确的样本的权重，喂给第二个模型。

最终也会给每个弱模型自己的权重。

## Gradient Boosting

 通过梯度下降来最小化误差。在每一次迭代，通过现有集成模型的误差来训练当前的模型。

<!--more-->

### XGBoost

- 每个树内部的并行计算
- 正则化
- 处理稀疏性
- 同层生长（横向优先）
- 大样本比较慢
- 只接受数值型，需要 encoding
- 参数：
  - General：种类
  - Tree：
    - eta（学习率）
    - max_depth, 
    - n_estimators, 
    - subsample（每次取样本的一部分）, 
    - colsample_bytree（取样本特征的一部分）
    -  gamma（生长树的阈值）
    - alpha（L1 正则）
    - lambda（L2 正则）

  -  Task：
    - objective


### LightGMB

- one-side sampling: 全部预测错误的和部分预测正确的，样本少，速度快
- exclusive feature bundling
- histogram-based algorithm 
- 垂直生长（纵向优先）
- 容易过拟合
- 自带 encoding
- 参数
  - Core:
    - objective
    - boosting
    - num_iterations
    - learning_rate
    - num_leaves
  - Learning:
    - max_depth
    - min_data_in_leaf
    - feature_fraction
    - lambda_l1
    - lambda_l2
  - IO:
    - max_bin（控制 histogram）
