---
layout: post
title: PerlShell
category: Tech
tags:
- CGI
- Perl
- PerlShell
published: true
comments: true
---

我买的这个虚拟主机不让我用 ssh 登录，所以不能在服务器上执行 Shell 命令。不过他既然给我开放了 CGI，而在 Perl 里可以直接调用系统命令，邪恶的我就想到了通过 Perl CGI 这个工具来达到我不可告人的目的。于是就有了这篇文章。

我把这个 project 命名为 PerlShell。她由两部分组成：网页前端和 CGI 后端。在网页中通过 form 来获取用户的输入，并把输入传递给 CGI；服务器端的 CGI 脚本执行用户所输入的命令并把结果返回给浏览器。原理很简单，程序代码也很简单。下面是 PerlShell 的 Demo：

*   PerlShell 主界面<br />
    <a href="http://i1171.photobucket.com/albums/r546/xiaoyong/PerlShell_1264171951611.png"><img src="http://i1171.photobucket.com/albums/r546/xiaoyong/PerlShell_1264171951611.png" width="600" /></a>
*   执行 `$ ls -alh` 之后的结果<br />
    <a href="http://i1171.photobucket.com/albums/r546/xiaoyong/PerlShell_1264171881514.png"><img src="http://i1171.photobucket.com/albums/r546/xiaoyong/PerlShell_1264171881514.png" width="600" /></a>
*   查看个人账户在服务器上的信息<br />
    <a href="http://i1171.photobucket.com/albums/r546/xiaoyong/PerlShell_1264172098252.png"><img src="http://i1171.photobucket.com/albums/r546/xiaoyong/PerlShell_1264172098252.png" width="600" /></a><br />
    可以看到它把我的 Shell 设成了 noshell ，所以我不能登录此服务器。
*   查看硬盘空间使用情况<br />
    <a href="http://i1171.photobucket.com/albums/r546/xiaoyong/PerlShell_1264172060046.png"><img src="http://i1171.photobucket.com/albums/r546/xiaoyong/PerlShell_1264172060046.png" width="600" /></a>
*   查看内存使用情况<br />
    <a href="http://i1171.photobucket.com/albums/r546/xiaoyong/PerlShell_1264172009912.png"><img src="http://i1171.photobucket.com/albums/r546/xiaoyong/PerlShell_1264172009912.png" width="600" /></a>

OK! 就这么多吧。基本上可以当成 Shell 来用了，虽然是简陋了点 ;)

如果你也有类似的需求，请[点此下载](http://xiaoyong.org/share/pshell.tar.gz "下载 PerlShell")网页源码和 CGI 脚本。

此 tarball 包目录树结构如下：

    pshell/
    |-- index.html
    |-- pshell.css
    `-- pshell.pl

**安装和使用：**
1.  把它们扔到合适的目录下，例如把 pshell.pl 放到 /cgi-bin 下面；
2.  index.html 中有对另外两个文件的引用，pshell.pl 中有对 pshell.css 的引用，所以您需要修改它们的路径；
3.  修改 pshell.pl 的权限（`$ chmod 700 pshell.pl`），然后用浏览器访问 index.html 。

<p><span style="color:#ff0000;">警告</span>：千万不要把网页和脚本的地址告诉别人，否则别人可以轻易地用一句 <code>$ rm -rf</code> 把你的数据全部删掉！平时最好把 pshell.pl 的权限设成 600 ，仅在需要使用的时候才打开可执行权限。</p>
