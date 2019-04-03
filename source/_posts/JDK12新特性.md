
---
title: JDK12新特性
date: 2019-03-25 12:44:59 +0800
tags: []
categories: 
---
作为“功能性版本”，JDK 12 总共包含 8 个新的 JEP ，分别为：
* 189: [Shenandoah: A Low-Pause-Time Garbage Collector (Experimental)](http://openjdk.java.net/jeps/189) ：新增一个名为 Shenandoah 的垃圾回收器，它通过在 Java 线程运行的同时进行疏散 (evacuation) 工作来减少停顿时间。<br />
* 230: [Microbenchmark Suite](http://openjdk.java.net/jeps/230)：新增一套微基准测试，使开发者能够基于现有的 Java Microbenchmark Harness（JMH）轻松测试 JDK 的性能，并创建新的基准测试。<br />
* 325: [Switch Expressions (Preview)](http://openjdk.java.net/jeps/325) ：对 switch 语句进行扩展，使其可以用作语句或表达式，简化日常代码。<br />
* 334: [JVM Constants API](http://openjdk.java.net/jeps/334) ：引入一个 API 来对关键类文件 (key class-file) 和运行时工件的名义描述（nominal descriptions）进行建模，特别是那些可从常量池加载的常量。<br />
* 340: [One AArch64 Port, Not Two](http://openjdk.java.net/jeps/340) ：删除与 arm64 端口相关的所有源码，保留 32 位 ARM 移植和 64 位 aarch64 移植。<br />
* 341: [Default CDS Archives](http://openjdk.java.net/jeps/341) ：默认生成类数据共享（CDS）存档。<br />
* 344: [Abortable Mixed Collections for G1](http://openjdk.java.net/jeps/344) ：当 G1 垃圾回收器的回收超过暂停目标，则能中止垃圾回收过程。<br />
* 346: [Promptly Return Unused Committed Memory from G1](http://openjdk.java.net/jeps/346) ：改进 G1 垃圾回收器，以便在空闲时自动将 Java 堆内存返回给操作系统。

总结<br />1.JDK12新增了一个垃圾回收器<br />2.新增一套微基准测试，方便测试JDK性能<br />3.对switch进行扩展，使其可以作语句的表达式。<br />4.新增一个API来对关键类和运行时共建进行建模<br />5.删除arm64 源码，保留arm64和aarch64移植<br />6.默认生成类数据共享存档<br />7.当G1垃圾回收超过暂停目标，则能终止垃圾回收过程<br />8.改进G1垃圾回收机制，以便在空闲时自动将JAVA堆内存韩会给操作系统

