---
layout: post
title: MPlayer over SSH
category: Tech
tags:
- MPlayer
- SSH
published: true
comments: true
---

如果你想看的音乐或视频不在本地，而是放在可以通过 SSH 登录的另一台机器上，你会怎么做？我猜你肯定会说：用 scp 把文件传到本地，或者用硬盘拷过来。这些都是可行的办法，不过缺点是必须创建文件副本，额外增加存储负担（如果你要做备份就另当别论了），并且增加了操作步骤。实际上有更为简单和直接的办法。

1.  一句命令搞定

        $ ssh user@10.10.190.2 "cat /path/to/music.mp3" | mplayer -

    把用户名，IP 地址，文件路径（可以是相对路径）替换成自己的就可以了，注意末尾的 \`-' 不可省略。只要你略微懂些 Shell 的知识，就知道这句命令在干啥了 :)

2.  求助于 <a title="SSHFS" href="http://fuse.sourceforge.net/sshfs.html" target="_blank">SSHFS</a>

    SSHFS 的功能类似于 NFS ，可以把远程的目录挂载到本地。不过它只依赖于 SSH ，不需要其它配置。具体设置方法请参看 <a title="SSHFS" href="http://wiki.archlinux.org/index.php/SSH#Mounting_a_Remote_Filesystem_with_SSHFS" target="_blank">ArchWiki</a> 。
