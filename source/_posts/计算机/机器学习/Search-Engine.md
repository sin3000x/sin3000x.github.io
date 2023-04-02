---
title: Search Engine Marketing
categories:
  - 计算机
  - 机器学习
mathjax: true
abbrlink: 49742
date: 2023-03-18 17:53:02
---

## TF-IDF（Term Frequency, Inverse Document Frequency）

$$
\text{IDF}=\frac{1}{\text{document frequency}}
$$

一个词在越多个文档中出现，说明它越不重要，对应的IDF越低。

<!--more-->

比如用户查询 `croquets and bitterballen`，在我们所有文档中，有 2 个包含 `croquets`，100 个包含 `and`，2 个包含 `bitterballen`。那么它们对应的 IDF 就分别为 0.5，0.01，0.5。

假设第一个文档中出现 8 次 `croquets`，10 次 `and`，2 次 `bitterballen`；第二个文档中只出现 100 次 `and`。

那么第一个文档的评分为 $8\times 0.5 + 10\times 0.01 + 2\times 0.5=5.1$，第二个文档的评分为 $0.01\times 100=1$。

这本质上就是利用 IDF 降低了一些无关词的权重。

## Google Ad Rank

$$
\text{ad rank}=\text{max cpc bid}\times\text{quality score}
$$

前一项是广告商出价（CPC，cost per click），后一项是网站质量评分。

还有一个 threshold 来决定广告的个数。

## Actual CPC

$$
\text{Actual CPC}={\text{next ad rank}\over\text{your quality score}}+0.01
$$

## Measurement

$$
\text{CTR (Click-Through Rate)}={\text{clicks}\over\text{impressions}}
$$

$$
\text{Conversion Rate}=\frac{\text{conversion}}{\text{clicks}}
$$

$$
\text{Cost Per Acquisition}=\frac{\text{total cost}}{\text{conversions}}
$$

## AB Testing

假设 A 有 30000 次 impression，CTR 为 0.1，点击量 3000；B 有 20000 次 impression，CTR 为 0.099，点击量为 1998 。如何比较 CTR？

原假设：两个 CTR 相等。
$$
p={n_1p_1+n_2p_2\over n_1+n_2}
$$

$$
z={p_1-p_2\over\sqrt{p(1-p)\left(\frac{1}{n_1}+\frac{1}{n_2}\right)}}
$$

见 [假设性检验](/posts/24350/index.html)。

## Customer's Journey

1. Trigger：电视广告、朋友推荐等
2. Initial Consideration Set：对比产品
3. Zero Moment of Truth：根据信息调整结果
4. First Moment of Truth：实体店、网店，第一印象
5. Purchase Decision：决定买或者不买
6. Second Moment of Truth：用户体验
