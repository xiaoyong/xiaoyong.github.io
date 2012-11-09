---
layout: post
title: "My Zsh Prompt Theme"
description: ""
category: Tech
tags: ['Zsh', 'Prompt']
---

As a member of CLI party, a nice prompt of my shell env is a **must**!. After
switching to Zsh from Bash, I redesigned my prompt. And I call it "Rainbow"
theme, as the colors are like a rainbow :-)

Here are the settings. To use it, simply throw them into your `~/.zshrc` or
`~/.zshrc.local` if you are using `grml-zsh-config`.
{% highlight sh %}
# ~/.zshrc
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
	vcs_info
}
setopt prompt_subst
# Red -> Green -> Blue -> Magenta, the light spectrum of rainbow
PROMPT='%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[blue]%}%~ %{$reset_color%}
%{$fg[magenta]%}%#%{$reset_color%} '
RPROMPT='${vcs_info_msg_0_}'
{% endhighlight %}

Here are some screenshots:

![Zsh prompt](http://i1171.photobucket.com/albums/r546/xiaoyong/zsh_prompt.png)
![Zsh prompt with git](http://i1171.photobucket.com/albums/r546/xiaoyong/zsh_prompt_git.png)
![Zsh prompt with svn](http://i1171.photobucket.com/albums/r546/xiaoyong/zsh_prompt_svn.png)

And in Bash, the same effect (without vcs info, of course) requires the following settings.
{% highlight bash %}
# ~/.bashrc
PS1='\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\] \[\e[0;34m\]\w\[\e[0m\]\n\[\e[0;35m\]\$\[\e[0m\] '
{% endhighlight %}

The magic numbers (0;3*) are used to specify colors. WTF!
