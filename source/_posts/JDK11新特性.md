
---
title: JDK11新特性
date: 2019-03-25 13:28:09 +0800
tags: []
categories: 
---
<a name="38f13363"></a>
# 一、JDK11新特性一览
* 181: Nest-Based Access Control
* 309: Dynamic Class-File Constants
* 315: Improve Aarch64 Intrinsics
* 318: Epsilon: A No-Op Garbage Collector
* 320: Remove the Java EE and CORBA Modules
* 321: HTTP Client (Standard)
* 323: Local-Variable Syntax for Lambda Parameters
* 324: Key Agreement with Curve25519 and Curve448
* 327: Unicode 10
* 328: Flight Recorder
* 329: ChaCha20 and Poly1305 Cryptographic Algorithms
* 330: Launch Single-File Source-Code Programs
* 331: Low-Overhead Heap Profiling
* 332: Transport Layer Security (TLS) 1.3
* 333: ZGC: A Scalable Low-Latency Garbage Collector (Experimental)
* 335: Deprecate the Nashorn JavaScript Engine
* 336: Deprecate the Pack200 Tools and API
<a name="2af02823"></a>
# 二、JDK11发布计划
| 日期 | 阶段 | 说明 |
| --- | --- | --- |
| 2018/06/28 | Rampdown Phase One (fork from main line) | 对进入Rampdown阶段的变化会应用越来越严格的审查。在阶段1中，只能修复 P1-P3 错误。 |
| 2018/07/26 | Rampdown Phase Two | 在阶段2中，只能修复 showstopper 错误 |
| 2018/08/16 | Initial Release Candidate |  |
| 2018/08/30 | Final Release Candidate | 在此阶段必须宣布最终候选版的发布日期并提交以进行测试 |
| 2018/09/25 | General Availability | 最终版本，可在生产环境正式使用 |

<a name="ba736b03"></a>
# 三、JDK11特性解读
<a name="f1d9d9ad"></a>
## JEP 181: Nest-Based Access Control（基于嵌套的访问控制）
<a name="08efa7ec"></a>
## JEP 309: Dynamic Class-File Constants（动态类文件常量）
Java的类型文件格式将被拓展，支持一种新的常量池格式：CONSTANT_Dynamic，加载CONSTANT_Dynamic会将创建委托给bootstrap方法。
<a name="73e82552"></a>
### 目标
其目标是降低开发新形式的可实现类文件约束带来的成本和干扰。
<a name="7a427c0f"></a>
## JEP 315: Improve Aarch64 Intrinsics（改进 Aarch64 函数）
<a name="682cd5d6"></a>
## JEP 318: Epsilon: A No-Op Garbage Collector（Epsilon — 一个无操作的垃圾收集器）
JDK上对这个特性的描述是：开发一个处理内存分配但不实现任何实际内存回收机制的GC，一旦可用堆内存用完，JVM就会退出。<br />如果有System.gc()的调用，实际上什么也不会发生（这种场景下和-XX:+DisableExplicitGC效果一样），因为没有内存回收，这个实现可能会警告用户尝试强制GC是徒劳。<br />用法非常简单：
```
-XX:+UseEpsilonGC。
```
<a name="5fec942d"></a>
### 动机
提供完全被动的GC实现，具有有限的分配限制和尽可能低的延迟开销，但代价是内存占用和内存吞吐量。<br />众所周知，Java实现可广泛选择高度可配置的GC实现。 各种可用的收集器最终满足不同的需求，即使它们的可配置性使它们的功能相交。 有时更容易维护单独的实现，而不是在现有GC实现上堆积另一个配置选项。<br />它的主要用途如下：
* 性能测试（它可以帮助过滤掉GC引起的性能假象）；
* 内存压力测试（例如，知道测试用例应该分配不超过1 GB的内存，我们可以使用-Xmx1g配置-XX:+UseEpsilonGC，如果违反了该约束，则会heap dump并崩溃）；
* 非常短的JOB任务（对于这种任务，接受GC清理堆那都是浪费空间）；
* VM接口测试；
* Last-drop 延迟&吞吐改进；
<a name="dc894810"></a>
## JEP 320: Remove the Java EE and CORBA Modules（删除 Java EE 和 CORBA 模块）
Java EE和CORBA两个模块在JDK9中已经标记"deprecated"，在JDK11中正式移除。JDK中deprecated的意思是在不建议使用，在未来的release版本会被删除。
<a name="5fec942d-1"></a>
### 动机
JavaEE由4部分组成：
* JAX-WS (Java API for XML-Based Web Services),
* JAXB (Java Architecture for XML Binding)
* JAF (the JavaBeans Activation Framework)
* Common Annotations.

但是这个特性和JavaSE关系不大。并且JavaEE被维护在Github（[https://github.com/javaee](https://github.com/javaee)）中，版本同步造成维护困难。最后，JavaEE可以单独引用，maven中心仓库也提供了JavaEE（[http://mvnrepository.com/artifact/javax/javaee-api/8.0](http://mvnrepository.com/artifact/javax/javaee-api/8.0)），所以没必要把JavaEE包含到JavaSE中。<br />至于CORBA，使用Java中的CORBA开发程序没有太大的兴趣。因此，在JavaEE就把CORBA标记为"Proposed Optional"，这就表明将来可能会放弃对这些技术的必要支持。
<a name="5898ff09"></a>
## JEP 321: HTTP Client (Standard)（标准HTTP客户端）
将JDK9引进并孵化的HTTP客户端API作为标准，即HTTP/2 Client。它定义了一个全新的实现了HTTP/2和WebSocket的HTTP客户端API，并且可以取代HttpURLConnection。<br />动机<br />已经存在的HttpURLConnection有如下问题:
* 在设计时考虑了多种协议，但是现在几乎所有协议现已不存在。
* API早于HTTP/1.1并且太抽象；
* 使用很不友好；
* 只能以阻塞模式工作；
* 非常难维护；
<a name="ff675a7b"></a>
## JEP 323: Local-Variable Syntax for Lambda Parameters（用于 Lambda 参数的局部变量语法）
在声明隐式类型的lambda表达式的形参时允许使用var。
<a name="5fec942d-2"></a>
### 动机
lamdba表达式可能是隐式类型的，它形参的所有类型全部靠推到出来的。隐式类型lambda表达式如下：
```
(x, y) -> x.process(y)
```
Java SE 10让隐式类型变量可用于本地变量:
```
var foo = new Foo();
for (var foo : foos) { ... }
try (var foo = ...) { ... } catch ...
```
为了和本地变量保持一致，我们希望允许var作为隐式类型lambda表达式的形参：
```
(var x, var y) -> x.process(y)
```
统一格式的一个好处就是modifiers和notably注解能被加在本地变量和lambda表达式的形参上，并且不会丢失简洁性：
```
@Nonnull var x = new Foo();
(@Nonnull var x, @Nullable var y) -> x.process(y)
```
<a name="c5b2468b"></a>
## JEP 324: Key Agreement with Curve25519 and Curve448（Curve25519 和 Curve448 算法的密钥协议）
用RFC 7748中描述到的 Curve25519 和Curve448 实现秘钥协议。RFC 7748定义的秘钥协商方案更高效，更安全。这个JEP的主要目标就是为这个标准定义API和实现。
<a name="5fec942d-3"></a>
### 动机
密码学要求使用 Curve25519 和Curve448 是因为它们的安全性和性能。JDK会增加两个新的接口XECPublicKey 和 XECPrivateKey，示例代码如下：
```
KeyPairGenerator kpg = KeyPairGenerator.getInstance("XDH");
NamedParameterSpec paramSpec = new NamedParameterSpec("X25519");
kpg.initialize(paramSpec); // equivalent to kpg.initialize(255)
// alternatively: kpg = KeyPairGenerator.getInstance("X25519")
KeyPair kp = kpg.generateKeyPair();
KeyFactory kf = KeyFactory.getInstance("XDH");
BigInteger u = ...
XECPublicKeySpec pubSpec = new XECPublicKeySpec(paramSpec, u);
PublicKey pubKey = kf.generatePublic(pubSpec);
KeyAgreement ka = KeyAgreement.getInstance("XDH");
ka.init(kp.getPrivate());
ka.doPhase(pubKey, true);
byte[] secret = ka.generateSecret();
```
<a name="8e8f3059"></a>
## JEP 327: Unicode 10
更新平台API支持Unicode 10.0版本（Unicode 10.0概述：Unicode 10.0 增加了8518 个字符, 总计达到了136,690个字符. 并且增加了4个脚本, 总结139个脚本, 同时还有56个新的emoji表情符号。参考：[http://unicode.org/versions/Unicode10.0.0/](http://unicode.org/versions/Unicode10.0.0/)）。
<a name="5fec942d-4"></a>
### 动机
Unicode是一个不断进化的工业标准，因此必须不断保持Java和Unicode最新版本同步。
<a name="31b48229"></a>
## JEP 328: Flight Recorder（飞行记录器）
提供一个低开销的，为了排错Java应用问题，以及JVM问题的数据收集框架，希望达到的目标如下：
* 提供用于生产和消费数据作为事件的API；
* 提供缓存机制和二进制数据格式；
* 允许事件配置和事件过滤；
* 提供OS，JVM和JDK库的事件；
<a name="5fec942d-5"></a>
### 动机
排错，监控，性能分析是整个开发生命周期必不可少的一部分，但是某些问题只会在大量真实数据压力下才会发生在生产环境。<br />Flight Recorder记录源自应用程序，JVM和OS的事件。 事件存储在一个文件中，该文件可以附加到错误报告中并由支持工程师进行检查，允许事后分析导致问题的时期内的问题。工具可以使用API从记录文件中提取信息。
<a name="7604ff7a"></a>
## JEP 329: ChaCha20 and Poly1305 Cryptographic Algorithms（ChaCha20 和 Poly1305 加密算法）
实现RFC 7539中指定的 ChaCha20 和 ChaCha20-Poly1305 两种加密算法。
<a name="5fec942d-6"></a>
### 动机
唯一一个其他广泛采用的RC4长期以来一直被认为是不安全的，业界一致认为当下ChaCha20-Poly1305是安全的。
<a name="d1b6ddf7"></a>
## JEP 330: Launch Single-File Source-Code Programs（启动单一文件的源代码程序）
增强Java启动器支持运行单个Java源代码文件的程序。
<a name="5fec942d-7"></a>
### 动机
单文件程序是指整个程序只有一个源码文件，通常是早期学习Java阶段，或者写一个小型工具类。以HelloWorld.java为例，运行它之前需要先编译。我们希望Java启动器能直接运行这个源码级的程序：
```
java HelloWorld.java
```
等价于：
```
javac -d <memory> HelloWorld.java
java -cp <memory> helloWorld
java Factorial.java 3 4 5
```
等价于：
```
javac -d <memory> Factorial.java
java -cp <memory> Factorial 3 4 5
```
到JDK10为止，Java启动器能以三种方式运行：
1. 启动一个class文件；
1. 启动一个JAR中的main方法类；
1. 启动一个模块中的main方法类；

JDK11再加一个，即第四种方式：启动一个源文件申明的类。
<a name="20cb9647"></a>
## JEP 331: Low-Overhead Heap Profiling（低开销的 Heap Profiling）
提供一种低开销的Java堆分配采样方法，得到堆分配的Java对象信息，可通过JVMTI访问。希望达到的目标如下：
* 足够低的开销，可以默认且一直开启；
* 能通过定义好的程序接口访问；
* 能采样所有分配；
* 能给出生存和死亡的Java对象信息；
* 动机

对用户来说，了解它们堆里的内存是很重要的需求。目前有一些已经开发的工具，允许用户窥探它们的堆，比如：Java Flight Recorder, jmap, YourKit, 以及VisualVM tools.。但是这工具都有一个很大的缺点：无法得到对象的分配位置。headp dump以及heap histo都没有这个信息，但是这个信息对于调试内存问题至关重要。因为它能告诉开发者，他们的代码发生（尤其是坏的）分配的确切位置。
<a name="ddf1cc36"></a>
## JEP 332: Transport Layer Security (TLS) 1.3（支持 TLS 1.3）
实现TLS协议1.3版本。（TLS允许客户端和服务端通过互联网以一种防止窃听，篡改以及消息伪造的方式进行通信）。
<a name="5fec942d-8"></a>
### 动机
TLS 1.3是TLS协议的重大改进，与以前的版本相比，它提供了显着的安全性和性能改进。其他供应商的几个早期实现已经可用。我们需要支持TLS 1.3以保持竞争力并与最新标准保持同步。这个特性的实现动机和Unicode 10一样，也是紧跟历史潮流。
<a name="beb47936"></a>
## JEP 333: ZGC: A Scalable Low-Latency Garbage Collector (可伸缩低延迟垃圾收集器)
ZGC：这应该是JDK11最为瞩目的特性，没有之一。但是后面带了Experimental，说明还不建议用到生产环境。看看官方对这个特性的目标描述：
* GC暂停时间不会超过10ms；
* 即能处理几百兆小堆，也能处理几个T的大堆（OMG）；
* 和G1相比，应用吞吐能力不会下降超过15%；
* 为未来的GC功能和利用colord指针以及Load barriers优化奠定基础；
* 初始只支持64位系统；
<a name="5fec942d-9"></a>
### 动机
GC是Java主要优势之一。然而，当GC停顿太长，就会开始影响应用的响应时间。消除或者减少GC停顿时长，Java将对更广泛的应用场景是一个更有吸引力的平台。此外，现代系统中可用内存不断增长， 用户和程序员希望JVM能够以高效的方式充分利用这些内存，并且无需长时间的GC暂停时间。<br />ZGC一个并发，基于region，压缩型的垃圾收集器，只有root扫描阶段会STW，因此GC停顿时间不会随着堆的增长和存活对象的增长而变长。<br />ZGC和G1停顿时间比较：
```
ZGC
                avg: 1.091ms (+/-0.215ms)
    95th percentile: 1.380ms
    99th percentile: 1.512ms
  99.9th percentile: 1.663ms
 99.99th percentile: 1.681ms
                max: 1.681ms
G1
                avg: 156.806ms (+/-71.126ms)
    95th percentile: 316.672ms
    99th percentile: 428.095ms
  99.9th percentile: 543.846ms
 99.99th percentile: 543.846ms
                max: 543.846ms
```
用法：
```
-XX:+UnlockExperimentalVMOptions -XX:+UseZGC
```
因为ZGC还处于实验阶段，所以需要通过JVM参数UnlockExperimentalVMOptions 来解锁这个特性。
<a name="73a9aae1"></a>
## JEP 335: Deprecate the Nashorn JavaScript Engine（弃用 Nashorn JavaScript 引擎）
<a name="6f87a8bf"></a>
## JEP 336: Deprecate the Pack200 Tools and API（弃用 Pack200 工具和 API）
> 参考:[http://openjdk.java.net/projects/jdk/11/](http://openjdk.java.net/projects/jdk/11/)



作者：IT4Life<br />链接：https://www.jianshu.com/p/ae60abb6752d<br />来源：简书<br />简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。

