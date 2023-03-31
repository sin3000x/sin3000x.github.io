---
title: Hexo 用法记录
abbrlink: 16107
categories:
- 计算机
- hexo
---
插入图片:
```html
<img src="/file/*" width="250" height="250"/>
{% asset_img image.jpg This is an image %}
```

嵌入 pdf:
```
{% pdf /file/*.pdf %}
```

链接文章:
```
{% post_link * 说明 %}
```
