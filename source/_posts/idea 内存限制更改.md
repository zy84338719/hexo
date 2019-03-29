
---
title: idea 内存限制更改
date: 2018-11-06 23:23:41 +0800
tags: []
categories: 
---
最近写安卓项目，内存经常爆。但是本机内存还是没有被吃满。<br />解决方法如下：<br />我猜是内存不够用了，就网上搜了一下修改idea的内存设置。

方法如下：

选中IntelliJ IDEA 14.app(这里的版本可以忽略), 然后右击 点击 “显示包内容”，在bin目录下找到idea.vmoptions并打开:

如图：<br />![](https://cdn.nlark.com/yuque/0/2018/png/190217/1541560315373-df0391ff-120e-486a-ab1f-67b3a29058b2.png#width=747)

![](https://cdn.nlark.com/yuque/0/2018/png/190217/1541560334967-ba857dbf-50f3-4e33-b122-8df00fc53097.png#width=747)


打开后，把内容修改为：

| ```
-Xms40m  
-Xmx2028m  
-XX:PermSize=128M   
-XX:MaxPermSize=1024m  
-XX:ReservedCodeCacheSize=700m  
-XX:+UseCompressedOops
```
 |
| --- |



