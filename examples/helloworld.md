---
title: A
author: B
---
<PRE>
|=----------------------[ Phrack Hello World ]=--------------------------=|

--[ Phrack Hello World

This is ascii text from my article. Markdown tags don't work here because
we are INSIDE a PRE-block.

Here is a code block with syntax highlighting:
</PRE>
```C
#include <stdio.h>
```
<PRE>

Note: The code block is between the </PRE> .. <PRE>.

An example of a WEB-LINK in a sentence (we have to exit the PRE-block first):
</PRE>
A page is a physical region of memory that can be mapped to one or
more [virtual addresses](https://wiki.osdev.org/Paging). These mappings have several flags that
determine how the mapped page can be accessed. For this article we only care
about the following 3 flags:
<PRE>

--[ 6. References
All links will go into one large block (the entire block is after </PRE>). Enumartion starts with 0.
 
</PRE>
0. [https://github.com/gin-gonic/gin](https://github.com/gin-gonic/gin)
1. [https://github.com/jackc/pgx](https://github.com/jackc/pgx)
1. [https://github.com/jackc/pgx/issues/1090](https://github.com/jackc/pgx/issues/1090)
<PRE>

|=[ EOF ]=---------------------------------------------------------------=|
</PRE>

