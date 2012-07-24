---
layout: post
title: Voodoo -- Search PICB
category: Tech
tags:
- PICB
- Search
- Voodoo
published: true
comments: true
---

说明：这是一封被 reject 的群发邮件，如果没有被 reject，那么所有 PICB 的男男女女早就已经看到了。正因为你们没看到，所以我要把它贴在这里。

> Hi, everyone!
> 
> I've set up a File Search Service (named Voodoo) which can search PICB's shared resources by filenames.<br />
> See: <http://xiaoyong.org/projects/voodoo/>
> 
> *Motivation*:<br />
> Thanks to PICB's great IT service, there're abundant resources available for us. Besides, we can share our own data with others simply by throwing them into public directories(e.g. `/picb/share/` , `/picb/student/` ). However, it's not so easy to get what we want out of the massive resources. Thus a Search Service is badly needed.
> 
> *Implementation*:<br />
> Voodoo is web-based, and its back-end is the \`<a title="mlocate" href="https://fedorahosted.org/mlocate/" target="_blank">mlocate</a>' program on Linux. The service is hosted on my personal website.
> 
> *Usage*:<br />
> The usage is quite straightforward. Anyone who are able to use Google are able to use Voodoo :)
> 
> *Demo*:<br />
> See the images below.<br />
> 1\. plain search:<br />
> （略过）
> 
> 2\. search with regular expression:<br />
> （略过）
> 
> Any questions you have, please contact me without any hesitation!
> 
> May Voodoo help you!
> 
> regards

简单来说，就是一项能够对 PICB 的共享资源按文件名搜索的服务。此项服务对非 PICB 的人没啥意义，因为您可以搜索到文件，却不能访问文件。

聪明的您肯定发现了 Voodoo 的界面和我前面一篇文章所介绍的 <a title="PerlShell" href="/Tech/2010/01/23/perlshell.html" target="_blank">PerlShell</a> 非常像。实际上，后者正是对前者的继承（注意顺序）。

最后，欢迎使用 <a title="Voodoo" href="/projects/voodoo/" target="_blank">Voodoo</a> ！
