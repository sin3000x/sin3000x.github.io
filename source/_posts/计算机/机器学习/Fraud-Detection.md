---
title: Fraud Detection
categories:
  - 计算机
  - 机器学习
tags:
  - pandas
  - 二分类
mathjax: true
description: 欺诈检测，主要是处理类别不平衡。
abbrlink: 22475
date: 2023-03-29 20:08:09
---
## 欺诈种类

### ATO（Account Hacker）

#### Device Malwares

- mobile interception
- reroute traffic
- malicious material in network security system

#### Phishing Websites

需要输入个人信息：信用卡、银行账号、登录信息等

### Identity Theft

拿到身份后去申请贷款、信用卡、银行透支

### Social Engineering

针对大众，或针对特定群体、组织

## 欺诈模型 feature

- 交易信息
  - 国家、地区、邮编、地址、姓名、邮箱、IP
  - 安全认证：手机、邮箱
  - 金额
  - 产品类型
  - 时间
- 设备信息
  - 操作系统、浏览器、app、IP、VPN
- 链接信息
  - 同一台设备上的账号数
- 风险评估
  - 邮箱域名、地址
- 时间聚合
- 其他
  - 性别、年龄、签发银行
  - 卡类型

<iframe src="/file/fraud.html" width="100%" height="11000"></iframe>

