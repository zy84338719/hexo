
---
title: mybait xml 配置谨记
date: 2019-03-05 11:13:26 +0800
tags: []
categories: 
---
select* from table where '字段1'>=10怎么表示，那么问题来啦<br />xml转义可以使用<br />![](https://cdn.nlark.com/yuque/0/2019/png/190217/1551755611316-53cb3fe4-54c4-4a18-89c7-611a8b9f7746.png#align=left&display=inline&height=253&originHeight=265&originWidth=781&size=0&status=done&width=746)<br />根据这个规则上面的sql写法应该变成<br />select *from table where ‘字段1’> =10

