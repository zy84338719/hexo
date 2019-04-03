
---
title: JAVA HttpURLConnection
date: 2019-03-31 01:08:23 +0800
tags: [learn]
categories: Java
---

在Java Web开发中，会话保持是服务器识别客户端（一般指浏览器）的方式。对此，各大浏览器都是支持会话保持的。然而在开发者通过Java API HttpURLConnection 开发网络请求工具的时候，HttpURLConnection是不支持会话的，需要自己动手获取服务器返回的会话信息。

这里以Java Web后台服务的会话为例，开发者需要编写程序，通过获取服务器返回的cookie值，截取其中的session ID。获取session ID之后，提交请求时将其加入RequestProperty，即可保持与服务器的当前会话。

通过服务器返回的信息获取会话例程如下：

```java
/**
	 * @author johnson
	 * @method getSessionID
	 * @description 执行从cookie获取会话sessionID的方法，用于保持与服务器的会话
	 * @param actionURL 远程服务器的URL
	 * */
public String getSessionID(String actionURL){
	String sessionID;
	try {
		URL url = new URL(actionURL);
		HttpURLConnection connection = (HttpURLConnection)url.openConnection();
		String cookieValue = connection.getHeaderField("set-cookie");
		if(cookieValue != null){
			sessionID = cookieValue.substring(0, cookieValue.indexOf(";"));
		}else{
			sessionID = "";
		}
	} catch (IOException e) {
		e.printStackTrace();
		sessionID = "";
	}
	return sessionID;
}
```

其中的session格式为:  JSESSIONID=XXXXXXXXX

获取session ID之后需要在每次发送请求的同时设置请求参数才能保持会话，例程如下：

```java
URL url = new URL("http://adugiudadiugb");

HttpURLConnection conn = (HttpURLConnection)url.openConnection();

if(!this.sessionID.equals("")){//如果sessionID存在，即存在会话

	connection.setRequestProperty("cookie", this.sessionID);

}
```

只要session ID 不改变，相应的会话也就不会改变

小结：利用Java 的HttpURLConnection进行请求发送时，如果需要保持同服务器的会话，需要先通过连接服务器获取session ID ，之后发送请求加入session ID到请求参数中就可以了。

注意：此时的服务器后台需要支持会话，即Java Web后台实现了session。




