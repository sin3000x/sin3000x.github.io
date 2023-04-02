---
title: Confusion Matrix
categories:
  - 计算机
  - 机器学习
mathjax: true
abbrlink: 39658
date: 2022-07-31 11:59:01
---
对于二分类问题, 结果被分为真阳, 假阳, 真阴, 假阴四种情况.

|   |  P |  N |
|:-:|:--:|:--:|
| Y | TP | FP |
| N | FN | TN |

<!--more-->

**accuracy**: 有多少预测是正确的?
$$
\text{accuracy}={TP+TN\over TP+FP+TN+FN}={T\over\text{all}}
$$

**precision**: 所有的预测阳性中多少是真的?
$$
\text{precision}={TP\over TP+FP}={TP\over Y}
$$

**recall**: 所有的阳性中有多少被预测出来?
$$
\text{recall}={TP\over TP+FN}={TP\over P}
$$

**F1 score**: recall 和 precision 的调和平均.
$$
\text{F}_1={2\over{1\over\text{recall}}+{1\over\text{precision}}}
$$

**FPR (False Positive Rate)**: 假阳率, 假阳占阴性的比率.
$$
\text{FPR}={FP\over N}
$$

**TPR (True Positive Rate)**: 真阳率, 真阳占阳性的比率.
$$
\text{TPR}={TP\over P}=\text{recall}
$$

**ROC (Receiver Operating Characteristic) 曲线**: TPR-FPR 图, 两者都随 threshold 变化.

<img src="ROC_curve.png" width="50%">

**AUC (Area Under Curve)**: ROC 曲线下的面积, 取值范围 $[0,1]$.