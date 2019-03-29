
---
title: java mysql 数据类型对照
date: 2018-12-10 09:04:03 +0800
tags: []
categories: 
---

| **类型名称** | **显示长度** | **数据库类型** | **JAVA类型** | **JDBC类型索引(int)** | **描述** |
| --- | --- | --- | --- | --- | --- |
|   |   |   |   |   |   |
| **VARCHAR** | **L+N** | **VARCHAR** | **java.lang.String** | **12** |   |
| **CHAR** | **N** | **CHAR** | **java.lang.String** | **1** |   |
| **BLOB** | **L+N** | **BLOB** | **java.lang.byte[]** | **-4** |   |
| **TEXT** | **65535** | **VARCHAR** | **java.lang.String** | **-1** |   |
|   |   |   |   |   |   |
| **INTEGER** | **4** | **INTEGER UNSIGNED** | **java.lang.Long** | **4** |   |
| **TINYINT** | **3** | **TINYINT UNSIGNED** | **java.lang.Integer** | **-6** |   |
| **SMALLINT** | **5** | **SMALLINT UNSIGNED** | **java.lang.Integer** | **5** |   |
| **MEDIUMINT** | **8** | **MEDIUMINT UNSIGNED** | **java.lang.Integer** | **4** |   |
| **BIT** | **1** | **BIT** | **java.lang.Boolean** | **-7** |   |
| **BIGINT** | **20** | **BIGINT UNSIGNED** | **java.math.BigInteger** | **-5** |   |
| **FLOAT** | **4+8** | **FLOAT** | **java.lang.Float** | **7** |   |
| **DOUBLE** | **22** | **DOUBLE** | **java.lang.Double** | **8** |   |
| **DECIMAL** | **11** | **DECIMAL** | **java.math.BigDecimal** | **3** |   |
| **BOOLEAN** | **1** | **同TINYINT** |   |   |   |
|   |   |   |   |   |   |
| **ID** | **11** | **PK (INTEGER UNSIGNED)** | **java.lang.Long** | **4** |   |
|   |   |   |   |   |   |
| **DATE** | **10** | **DATE** | **java.sql.Date** | **91** |   |
| **TIME** | **8** | **TIME** | **java.sql.Time** | **92** |   |
| **DATETIME** | **19** | **DATETIME** | **java.sql.Timestamp** | **93** |   |
| **TIMESTAMP** | **19** | **TIMESTAMP** | **java.sql.Timestamp** | **93** |   |
| **YEAR** | **4** | **YEAR** | **java.sql.Date** | 91 |  |

| 对于bolb，一般用于对图片的数据库存储，原理是把图片打成二进制，然后进行的一种存储方式，在java中对应byte［］数组。<br /><br />对于boolen类型，在mysql数据库中，个人认为用int类型代替较好，对bit操作不是很方便，尤其是在具有web页面开发的项目中，表示0/1，对应java类型的Integer较好。 |
| --- |

<br /> 


decimal列的声明语法是decimal(m,d)。

在mysql5.1中，参数的取值范围： <br />1、M是数字的最大数（精度）。其范围为1～65（在较旧的MySQL版本中，允许的范围是1～254）。 <br />2、D是小数点右侧数字的数目（标度）。其范围是0～30，但不得超过M。 <br />说明：float占4个字节，double占8个字节，decimail(M,D)占M+2个字节。 <br />如DECIMAL(5, 2) 的最大值为9 9 9 9 . 9 9，因为有7 个字节可用。 

