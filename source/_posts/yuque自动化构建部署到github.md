
---
title: yuque自动化构建部署到github
date: 2019-03-30 00:10:22 +0800
tags: [Hexo]
categories: 教程
---

<a name="9676e737"></a>
## 写在前面
[语雀](https://www.yuque.com/) 是一款非常好用的知识管理网站（类似 GitBook)，它的编辑器非常好用，而且支持导出 Markdown，这篇文章是教你如何使用语雀的编辑器写静态博客。这里的静态博客用了 Hexo，Jekyll 也是没有问题的。<br />[]()
<a name="dae58b01"></a>
## [](https://luan.ma/post/yuque2blog/#%E5%88%9B%E5%BB%BA-Hexo-%E5%8D%9A%E5%AE%A2)创建 Hexo 博客
已经有 Hexo 博客的可以跳过。如果你是 Jekyll ，也可以跳过。
* 安装 Node.js
* 安装 Hexo 脚手架
| 1 | npm install -g hexo-cli |
| --- | --- |

* 初始化一个博客
| 123 | hexo init <folder>cd <folder>npm install |
| --- | --- |

* 其他设置和命令见：[https://hexo.io/zh-cn/docs/](https://hexo.io/zh-cn/docs/)

[]()
<a name="ac8d0a27"></a>
## [](https://luan.ma/post/yuque2blog/#%E5%AE%89%E8%A3%85%E8%AF%AD%E9%9B%80%E6%96%87%E7%AB%A0%E4%B8%8B%E8%BD%BD%E6%8F%92%E4%BB%B6)安装语雀文章下载插件
[yuque-hexo](https://github.com/x-cold/yuque-hexo/) 是一个 Node.js 环境下的语雀下载器，使用 npm 安装
* 安装 yuque-hexo
| 1 | npm i -g yuque-hexo |
| --- | --- |

* 注册语雀，创建知识库，获得你的个人路径和知识库的名字，比如我的博客的知识库是 [https://www.yuque.com/page/](https://www.yuque.com/page/zhangyi-ul3zj)zhangyi-ul3zj
* 在 Hexo 博客的目录下面的 package.json 中，进行下面的配置

```go
{
  "name": "your hexo project", //如果原来已经有这个不用再加了，直接加下面的就可以
  "yuqueConfig": {
                   "cachePath": "yuque.json",

                   "adapter": "hexo",

                   "concurrency": 5,

                   "baseUrl": "https://www.yuque.com/api/v2",

                   "login": "zhangyi-ul3zj",

                   "repo": "blog",

                  "mdNameFormat": "title",

                  "postPath": "source/_posts"

                }

}
```

* 如果不是 Hexo 博客，则需要按照上面的文件保存一个 package.json 到博客目录，并且配置 postPath 为正确的文章目录
* 同步文章
| 1 | yuque-hexo sync |
| --- | --- |

PS: 插件支持 Front-matter，在语雀写文章的时候直接写在前面，然后插入一条分割线即可，不写也没问题：

| 123 | tags: [Hexo]categories: 教程date: 2018-10-05 10:43:50 |
| --- | --- |

[]()
<a name="ba85f046"></a>
## [](https://luan.ma/post/yuque2blog/#%E6%89%8B%E5%8A%A8%E5%90%AF%E5%8A%A8-%E9%83%A8%E7%BD%B2-Hexo-%E5%8D%9A%E5%AE%A2)手动启动/部署 Hexo 博客
* 本地启动（调试用）
| 1 | hexo s |
| --- | --- |

* 生成 html 不部署
| 1 | hexo g |
| --- | --- |

* 自动上传到服务器/静态空间/git （部署）
1. 先找到一个部署插件<br />
1. 在配置文件中配置好相关的账号密码<br />
1. 在 hexo 中生成 HTML 并且部署<br />
| 1 | hexo g -d |
| --- | --- |

[](https://luan.ma/post/yuque2blog/#%E8%87%AA%E5%8A%A8%E5%8C%96%E9%83%A8%E7%BD%B2%EF%BC%88%E6%96%B0%E5%86%85%E5%AE%B9%EF%BC%89)<br />[]()
<a name="c566e693"></a>
### [](https://luan.ma/post/yuque2blog/#Travis-ci-severless)Travis-ci + severless
可以参考原文：[https://segmentfault.com/a/1190000017797561](https://segmentfault.com/a/1190000017797561)<br />Travis_ci具体配置<br />可以参考：[https://www.cnblogs.com/morang/p/7228488.html](https://www.cnblogs.com/morang/p/7228488.html)

