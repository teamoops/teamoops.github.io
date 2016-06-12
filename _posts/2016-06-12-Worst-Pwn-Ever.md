---
layout: post
title: Worst-Pwn-Ever Backdoor2016
category: writeups
author: bryce
---

Worst-Pwn-Ever was a 100 point pwn challenge from Backdoor2016. Here is the description:

```
tocttou is an environmentalist. But some say he has a vicious motive and he uses nature to hide his dark side.
We found a weird shell on his amazon (pun inteded) web services.
Can you tell us what is he up to?

Tip: he might shut down the machine if he notices you - and he will (maybe in 45 seconds).

Access: nc hack.bckdr.in 9008
Created by: Ashish Chaudhary
```

The binary for this challenge can be found on Backdoor's website.

When this challenge is run you are launched into what looks to be a limited shell. After
running a couple miscellaneous Linux commands (I should have documented which it was but I did not)
including I was able to get a `NameError:` error which led me to believe this was a Python program.
At this point I tried an `import os` command, which is a python library that can run system
commands like `cat flag`, but that also led to a `NameError`.

After a couple other failed ideas and a night of sleep I tried a `__builtins__` function...

```
input(__builtins__.__import__('os'))
```

... which worked!

Great, now we know how to import system we just need to locate the flag. Luckily the
title is a big clue for this pwn sounds a lot like pun. So I re-read the description
and realized it said environmentalist so I thought "let's check the environment variables",
with the `os` module which is easy enough! The final working code was this:

```
input(__builtins__.__import__('os').system("printenv"))
```

Which got us our flag!

If you are interested in more content checkout [bryceandress.github.io](http://bryceandress.github.io)!
