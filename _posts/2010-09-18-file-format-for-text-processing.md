---
layout: post
title: 文本处理之文件格式
category: Tech
tags:
- Vim
- 文件格式
published: true
comments: true
---

我曾经天真地认为，纯文本格式是全宇宙最通用的格式，具有跨编辑器、跨操作系统、跨星球的优点。后来我才发现，要实现这些目标，必须克服两只拦路虎。一个是文件格式，一个是字符编码。本文讨论文件格式问题，后面一篇文章将讨论字符编码问题。

据说早期人们用打字机打字的时候，要用两个动作才能完成另起一行。一个是把滑动架移回首位（称为回车，`<CR>`），另一个是把纸上移一行（称为换行，`<LF>`）。后来计算机出现了，又后来各种操作系统出现了，它们在处理换行符上出现了分歧，DOS/Windows 采用了 `<CR><LF>` 两个字符来表示换行符，UNIX 采用了 `<LF>`，Mac 则采用了 `<CR>`。就是这些分歧，给用户带来了无尽的困扰。

<!--more-->

举个例子，用这行命令可以在文本每一行的行首添加行号，并且通过 `cat -A` 把特殊字符都显示出来：

{% highlight console %}
$ perl -ne '$i++; print "$i. $_";' sample.txt | cat -A
{% endhighlight %}

sample.txt 的内容为：

    There're
    more
    than
    one
    lines
    here.

如果 sample.txt 是 unix 格式的，那么得到的结果是：

    1. There're$
    2. more$
    3. than$
    4. one$
    5. lines$
    6. here.$

OK，这是我们想要的结果。如果是 dos 格式的，结果是：

    1. There're^M$
    2. more^M$
    3. than^M$
    4. one^M$
    5. lines^M$
    6. here.^M$</pre>

虽然多了一个奇怪的字符，但勉强能接受。而如果是 mac 格式的，结果则是：

    1. There're^Mmore^Mthan^Mone^Mlines^Mhere.^M

只有一行了，这根本不是我要的结果！
其中 `$` 表示换行符，`^M` 表示 `<CR>` 字符。由于是在 Linux 下面，所以只认 `<LF>`，不认 `<CR>`。

当处理来自其它系统的文本文件的时候，结果极有可能出乎意料。这个时候我们首先想到的就应该是换行符的问题，如果没想到，那只能要么怀疑自己的双眼，要么怀疑自己编程的能力了 :-)

要彻底摆脱文件格式的困扰，我们必须掌握这两个技能：

1.  判断一个文本文件到底采用了哪种文件格式
2.  知道它所采用的文件格式后，还要能够把它转换成想要的其它文件格式

值得庆幸的是，用 Vim 就能轻易地完成这两项任务。在 `.vimrc` 中添加下面这行：

{% highlight vim %}
set fileformats=unix,dos,mac
{% endhighlight %}

Vim 就会依次猜测文件是否采用了 unix, dos, mac 格式。

查看当前文件格式：`echo &fileformat`。

用 Vim 来转换文件格式也非常简单，在命令模式下，输入 `:set fileformat=dos`（还可以是 `unix` / `mac`），然后 `:w` 写入文件，就完成转换了。

除了 Vim，在 UNIX/Linux/Mac 系统中还有两个工具可以用：`dos2unix` 和 `unix2dos`，它们的含义只要看名字就能明白了。
