
---
title: Java 小抄（一）
date: 2018-11-05 20:24:15 +0800
tags: []
categories: 
---
之所以把这个文档叫做小抄的原因，是因为这个文档很杂碎，很小的知识点。
```java
#今天看到个东西，🤦‍♂️
System.cout.println();
#注意这是cout。报错没有这个方法
String st = " world";
st.concat("hello");
#注意这个方法返回的是concat会创建一个新的对象，新对象的内容是"hello world";
System.out.println(st);
#结果是 world
```

做题做到了这个题，虽然自己知道结果是什么但是忽然想到{}代码块的时候输出顺序是什么！
```java
@Test
    public void test1(){
        A a = new B();
        a=new B();

class A{
    static {
        System.out.println("1");
    }
    public A(){
        System.out.println("A");
    }
    {
        System.out.println("a");
    }
}

class B extends A{
    static {//静态语块
        System.out.println("2");
    }
    public B(){//构造函数
        System.out.println("B");
    }
    {//构造语块
        System.out.println("b");
    }
}
```
虽然这个题很无聊，但是自己还是做的含糊不清。尤其是第二次 a = new B()的时候；发现自己对于这里掌握不是很好。查了一下需要有很多改进的地方。第一静态变量只会加载一次 仅仅是静态加载一次。<br />class B extends A 优先加载两个方法中的静态方法，然后加载静态代码块。<br />总结是优先级：1.静态语块（从父到子）。2.构造语块。3.构造函数

