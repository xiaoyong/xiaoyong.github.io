---
layout: post
title: xterm 中文字体设置
category: Tech
tags:
- xterm
- 中文
- 字体
published: true
comments: true
---

Wikipedia says: 
> In computing, xterm is the standard terminal emulator for the X Window System.

相比 Konsole、GNOME-Terminal 这类现代模拟终端程序，xterm 更适合复古主义者和追求极致简单轻量的 Linux 用户。要在 xterm 中显示和输入中文，只要设置好中文字体就行了。设置方法是，在 `~/.Xdefaults` 中添加以下内容：

    ! English font
    xterm*faceName: DejaVu Sans Mono:antialias=True:pixelsize=14
    ! Chinese font
    xterm*faceNameDoublesize: WenQuanYi Micro Hei:pixelsize=14

以 `!` 开头的行是注释。注意中文字体和西文字体可以分开设置。
