---
description: 一些操作dom的问题.
---

# dom篇

#### iframe

1.iframe常见用法`<iframe src="" frameborder=""></iframe>` 其中src写入路径.  
2.iframe常见的dom操作:  
  1.获取iframe内部dom的操作.  
  2.iframe获取外部dom操作.

```text
// 取内部dom.
var iframeDom = document.getElementsByTagName("iframe")[0].contentWindow.document;
// 取外部dom.
var fatherIframeDome = window.parent.document.getElementById("xx");
```

3.相关知识链接.  
    \[操作dom\]\([http://caibaojian.com/js-get-iframe.html](http://caibaojian.com/js-get-iframe.html)\)

