
---
title: Java (二)探 多线程
date: 2018-10-17 00:28:08 +0800
tags: []
categories: 
---
<a name="4phbbs"></a>
## [](#4phbbs)runnable_or_callable
Runable 与callable 是两个线程接口，这两个线程方法都是通过Thread类来启动线程，只不过runable内只有一个run方法，而callable是有返回值的，返回值类型为FutureTask。
```
https://github.com/zy84338719/java/tree/master/src/com/zhangyi/multithread/callable.java
```
Java 创建执行创建一个JVM进程，然后由JVM创建线程，主线程名称为main。
<a name="559nex"></a>
### [](#559nex)记：JVM 是一个进程，所有的方法有主线程创建一个线程。

<a name="1gqhgl"></a>
## [](#1gqhgl)线程优先级设置后，线程执行顺序有可能被提高
主方法main线程优先级为中等优先级。

