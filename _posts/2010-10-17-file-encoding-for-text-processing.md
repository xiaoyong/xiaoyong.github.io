---
layout: post
title: 文本处理之字符编码
category: Tech
tags:
- Vim
- 字符编码
published: true
comments: true
---

相信每一个 Linux 用户都经历过汉字乱码的问题。通常从 Windows 上流出来的包含汉字的文本文件都采用 GB2312/GBK/GB18030（简体）或者 BIG5（繁体）编码。而从 Linux/UNIX/Mac 上流出来的则通常采用 UTF-8 编码。在用编辑器查看中文文本的时候，如果不能正确识别字符编码，就会出现乱码。

在得到一个中文文本文件之后，我们如何去判断/转换它的编码呢？有以下几种方法：

1.  试错法，也就是瞎猜。简体中文先猜 GBK；如果不是，则猜 UTF-8；再不对，还有可能是 UTF-16（日本动漫/娱乐节目的中文字幕经常用此编码）。繁体中文的猜测次序是：BIG5 => GBK => UTF-8 => UTF-16。

2.  借用工具法。Linux 下有 `enca/enconv` 这个很好用的工具。
{% highlight console %}
# 检测文件编码：
$ enca -L zh_CN filename
# 把字符编码转换成 UTF-8：
$ enconv -L zh_CN -x UTF-8 filename
{% endhighlight %}

如果你是一名 Vimer，那么可以在 `.vimrc` 中添加以下内容，下次用 Vim 打开文件的时候，它会自动探测编码。
{% highlight vim %}
set fileencodings=ucs-bom,utf-8,cp936,euc-tw,euc-jp,euc-kr,latin1
{% endhighlight %}

也可以在 Vim 中转换编码：在命令模式下，输入 `:set fileencoding=utf8` （还可以是 cp936，即 GBK 以及其它）然后保存，即可把编码转换成 UTF-8。
