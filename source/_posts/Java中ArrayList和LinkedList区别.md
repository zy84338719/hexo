
---
title: Java中ArrayList和LinkedList区别
date: 2018-11-20 14:49:16 +0800
tags: []
categories: 
---
其实这两个数据结构蛮好玩的，都是List列表存储<br />1.ArrayList底层是数组存储，LinkedList底层是基于双向链表存储的<br />2.由于底层存储方式不同，一些特性也就由此展现。<br />3.数组存储：添加删除操作都是比较浪费存储时间的，以为每一次操作，都要进行数据的迁移。但是对于数据经常查询.get()方法的时候，Array的优势就体现了。基于链表存储，他的添加删除操作是比较快的，但查询来说就相对较慢，因为他需要遍历每一个节点，从而得倒想要的数据。

```java
package com.zhangyi;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class compare {
    static final int N=100000;
    static long timeList(List list){
        long start=System.currentTimeMillis();
        Object o = new Object();
        for(int i=0;i<N;i++) {
            list.add(0, o);
        }
        return System.currentTimeMillis()-start;
    }
    static long readList(List list){
        long start=System.currentTimeMillis();
        for(int i=0,j=list.size();i<j;i++){

        }
        return System.currentTimeMillis()-start;
    }

    static List addList(List list){
        Object o = new Object();
        for(int i=0;i<N;i++) {
            list.add(0, o);
        }
        return list;
    }
    public static void main(String[] args) {
        System.out.println("ArrayList添加"+N+"条耗时："+timeList(new ArrayList()));
        System.out.println("LinkedList添加"+N+"条耗时："+timeList(new LinkedList()));

        List list1=addList(new ArrayList<>());
        List list2=addList(new LinkedList<>());
        System.out.println("ArrayList查找"+N+"条耗时："+readList(list1));
        System.out.println("LinkedList查找"+N+"条耗时："+timeList(list2));
    }
}
```
```basic
/Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/bin/java "-javaagent:/Applications/IntelliJ IDEA.app/Contents/lib/idea_rt.jar=52811:/Applications/IntelliJ IDEA.app/Contents/bin" -Dfile.encoding=UTF-8 -classpath /opt/dev/java/Course/out/production/Course:/Users/zhangyi/.m2/repository/org/junit/jupiter/junit-jupiter-api/5.3.1/junit-jupiter-api-5.3.1.jar:/Users/zhangyi/.m2/repository/org/apiguardian/apiguardian-api/1.0.0/apiguardian-api-1.0.0.jar:/Users/zhangyi/.m2/repository/org/opentest4j/opentest4j/1.1.1/opentest4j-1.1.1.jar:/Users/zhangyi/.m2/repository/org/junit/platform/junit-platform-commons/1.3.1/junit-platform-commons-1.3.1.jar:/Users/zhangyi/.m2/repository/junit/junit/4.12/junit-4.12.jar:/Users/zhangyi/.m2/repository/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar com.zhangyi.compare
ArrayList添加100000条耗时：523
LinkedList添加100000条耗时：6
ArrayList查找100000条耗时：1
LinkedList查找100000条耗时：2

Process finished with exit code 0
```
通过这个小程序，可以清楚的发现查找如果对于数据存储而言，如果Arraylist进行添加数据，除了在尾部添加效率相对较高，但是还要考虑扩容问题，那么LinkedList就比较划算了，而数据查找起来，ArrayList相对Linkedlist优势比较明显。所以我觉得若果在数据库读取数据的时候存储应该优先考虑将数据保存为ArrayList格式。

