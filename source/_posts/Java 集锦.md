
---
title: Java 集锦
date: 2018-10-18 15:50:08 +0800
tags: []
categories: 
---
<a name="3gy6hb"></a>
### [](#3gy6hb)String StringBuffer StringBuilder区别
String 是不可修改的（开发常用）因为不可更改，所以效率高<br />StringBuffer 是线程安全的有synchronized 关键字（字符变化比较频繁，使用）<br />StringBuilder 不是线程安全的

<a name="zwyixb"></a>
### [](#zwyixb)Runtime 单例设计模式
具体查看文档，同getRuntime（）<br />Runtime 是一个私有方法，每一个程序在运行时都会自动启动它，当程序内产生垃圾后，会调用Runtime中 gc（） 类，用来回收内存。（该方法是不定期调用的）

<a name="wu1qok"></a>
### [](#wu1qok)System 类
System中有gc方法，从源码上看是调用Runtime的gc方法；<br />final ， finally ，finalize却别<br />Final 是一个关键字，用于定义不能被继承的父类，和不能重写的方法<br />Finally 是一个异常处理的统一处出口。<br />Finalize 是一个Object调用finalize来做类似于C++析构函数的作用。



