---
title: Hexo 用法记录
abbrlink: 16107
categories:
  - 计算机
  - hexo
---
## 插入图片
```html
<img src="/file/*.jpg" width="250" height="250"/>
```

```markdown
{% asset_img image.jpg This is an image %}
```

## 插入多个图片（仅限 next 主题）
```
{% gp 2-2 %}
![caption](/file/*.jpg)
![caption](/file/*.jpg)
{% endgp %}
```
第一个数字表示图片数量，第二个数字表示布局选项。

## 嵌入 pdf
```
{% pdf /file/*.pdf %}
```

## 链接文章
```
{% post_link * 显示文字 %}
```

```markdown
[title](/posts/***/index.html)
```