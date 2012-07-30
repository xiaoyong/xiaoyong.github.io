---
layout: post
title: 几种编程语言运行效率的粗略比较
category: Tech
tags:
- Bash
- C++
- Perl
- Python
- Ruby
- 效率
- 比较
published: true
comments: true
---

本文通过计算 Fibonacci 数列来比较几种编程语言的运行效率，包括常见的 3 类编程语言：编译性语言（C++），解释性语言（Perl, Python, Ruby）和脚本语言（Bash）。Fibonacci 数列有多种算法，这里使用的是递归法。

说明：各种语言各有所长，对不同的操作效率不尽相同。这里只看了一种情况，是极为粗略的比较，权当娱乐了 ~~

程序运行环境：
    CPU: Intel T2350
    Memory: 1GB
    OS: Fedora 14
    Linux Kernel: 2.6.35.6-48.fc14.i686

各种编译器 / 解释器版本信息（本人比较关注 Ruby，所以评测了两个版本的 Ruby 解释器）：
    gcc version 4.5.1 20100924 (Red Hat 4.5.1-4) (GCC)
    perl 5, version 12, subversion 2 (v5.12.2) built for i386-linux-thread-multi
    Python 2.7 (r27:82500, Sep 16 2010, 18:03:06)
    ruby 1.8.7 (2010-08-16 patchlevel 302) [i386-linux]
    ruby 1.9.2p35 (2010-11-02 revision 29665) [i686-linux]
    GNU bash, version 4.1.7(1)-release (i386-redhat-linux-gnu)

程序代码如下：

<!--more-->

C++版（fibonacci.cpp）
{% highlight cpp %}
{% include code/fibonacci.cpp %}
{% endhighlight %}

Perl 版（fibonacci.pl）
{% highlight perl %}
{% include code/fibonacci.pl %}
{% endhighlight %}

Python 版（fibonacci.py）
{% highlight python %}
{% include code/fibonacci.py %}
{% endhighlight %}

Ruby 版（fibonacci.rb）
{% highlight ruby %}
{% include code/fibonacci.rb %}
{% endhighlight %}

Bash 版（fibonacci.sh）
{% highlight bash %}
{% include code/fibonacci.sh %}
{% endhighlight %}

主程序用 Ruby，使用 Gruff 模块来画图
{% highlight ruby %}
{% include code/main.rb %}
{% endhighlight %}

在 n 取不同值下各个版本程序的运行时间（本来想用表格的，发现一行放不完，多行/转置太麻烦了，凑合着看吧 :-）：

    # No Bash (n = 2, 4, ..., 32)
    C++: 0.014616 0.005932 0.006124 0.006147 0.006429 0.006814 0.008096 0.005878 0.007844 0.009254 0.009913 0.010877 0.015585 0.025772 0.026195 0.060132
    Ruby-1.9.2: 0.025062 0.022758 0.017313 0.020393 0.020181 0.020269 0.020819 0.020977 0.025425 0.032843 0.026662 0.043297 0.081736 0.183789 0.456225 1.170084
    Perl: 0.015518 0.016121 0.017061 0.017639 0.020361 0.019265 0.023919 0.025519 0.034577 0.052177 0.063214 0.143937 0.358551 0.90879 2.393584 6.134109
    Python: 0.072047 0.064298 0.058883 0.058075 0.056147 0.058195 0.057439 0.057393 0.058493 0.069465 0.083222 0.109321 0.197521 0.415247 0.994579 2.503102
    Ruby-1.8.7: 0.020334 0.012589 0.010816 0.01228 0.013191 0.017026 0.023844 0.033048 0.05195 0.065379 0.138034 0.316718 0.798044 2.073424 5.383572 14.39978

    # With Bash (n = 2, 4, ..., 20)
    C++: 0.008331 0.003803 0.003619 0.003912 0.006395 0.006822 0.006398 0.006918 0.006765 0.007366
    Ruby-1.9.2: 0.018158 0.017577 0.021608 0.023735 0.016365 0.019361 0.023855 0.024327 0.02903 0.032401
    Perl: 0.016652 0.015514 0.014294 0.015016 0.015607 0.015555 0.017225 0.021482 0.032593 0.046648
    Python: 0.078785 0.074991 0.065337 0.070789 0.073334 0.06341 0.064527 0.082283 0.077052 0.081154
    Ruby-1.8.7: 0.02199 0.018868 0.024702 0.022364 0.02092 0.025425 0.029925 0.042073 0.052613 0.076533
    Bash: 0.021872 0.027994 0.052569 0.112122 0.222159 0.71495 1.829128 4.942952 13.230605 34.971108

画出的图表如下：

1.  包括 Bash, n = 2, 4, ..., 20
    ![](http://i1171.photobucket.com/albums/r546/xiaoyong/graphWithBash_20.png)

2.  包括 Bash, n = 2, 4, ..., 12
    ![](http://i1171.photobucket.com/albums/r546/xiaoyong/graphWithBash_12.png)
    从图中可以看到 Bash 的效率大大低于其它语言。为了能看出其它语言之间的差别，把 Bash 剔除之后重新画图，得到以下结果。

3.  剔除 Bash, n = 2, 4, ..., 32
    ![](http://i1171.photobucket.com/albums/r546/xiaoyong/graphNoBash_32.png)
    在 n 取值较大时，效率是 C++ >> Ruby-1.9.2 > Python > Perl > Ruby-1.8.7

4.  剔除 Bash, n = 2, 4, ..., 24
    ![](http://i1171.photobucket.com/albums/r546/xiaoyong/graphNoBash_24.png)
    缩小 n 之后，发现 Python 比其它几个都要慢一点。

5.  剔除 Bash, n = 2, 4, ..., 16
    ![](http://i1171.photobucket.com/albums/r546/xiaoyong/graphNoBash_16.png)
    看得更仔细一点。

总结：

*   运行效率上，编译性语言 >> 解释性语言 >> 脚本语言
*   解释性语言之间也有几倍的差别
*   随着计算量的增大，各种语言的表现不尽相同，比如 Ruby-1.8.7 一开始比其它解释性语言都要快，后来比它们都要慢
*   对同一种解释性语言来说，解释器的改进可以极大地提高运行效率

最后我要说：我们家 Ruby 不慢 :-)
