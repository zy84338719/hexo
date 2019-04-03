
---
title: Spring中容器管理
date: 2018-12-14 09:40:23 +0800
tags: []
categories: 
---
今天在写程序的时候看见一个以前没有见过的注解（@Component），在网上查找过后，经过实践，决定把它记录下来。 <br />1、@controller 控制器（注入服务）

用于标注控制层，相当于struts中的action层<br />2、@service 服务（注入dao）

用于标注服务层，主要用来进行业务的逻辑处理<br />3、@repository（实现dao访问）

用于标注数据访问层，也可以说用于标注数据访问组件，即DAO组件.<br />4、@component （把普通pojo实例化到spring容器中，相当于配置文件中的 <br /><bean id="" class=""/>）

泛指各种组件，就是说当我们的类不属于各种归类的时候（不属于@Controller、@Services等的时候），我们就可以使用@Component来标注这个类。<br />案例： <br /><context:component-scan base-package=”com.*”> <br />上面的这个例子是引入Component组件的例子，其中base-package表示为需要扫描的所有子包。 <br />共同点：被@controller 、@service、@repository 、@component 注解的类，都会把这些类纳入进spring容器中进行管理

