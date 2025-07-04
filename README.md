# Create and edit a PHRACK article with Markdown

This is used by PHRACK authors to convert their PHRACK ASCII article to Markdown.

Markdown allows code syntax highliting and other formatting tricks.

Please use this setup before submitting the Markdown version of your article to Phrack Staff.

---

Convert your TXT article to article.md:
```shell
cat article.txt | { echo -e '---\ntitle: A\nauthor: B\n---\n<PRE>'; sed -e 's|\&|\&amp\;|g;s|<|\&lt\;|g;s|^```|\\`\\`\\`|g'; echo '</PRE>';} >article.md
```

Start Phrack MDBuilder:
```shell
docker run --rm -p8080:80 -v $(pwd):/src -it phrackzine/mdbuilder
```

View your article: [http://localhost:8080](http://localhost:8080).

Open your favorite editor and add Markdown tags to your `article.md`.
* You may need to convert some `&lt;` and `&amp;` back to `<` and `&`.
* You have to use `</PRE>` before using any markdown syntax.
* Don't forget to add `<PRE>` after you are done with our Markdown syntax.

Example `article.md`:
````txt
---
title: A
author: B
---
<PRE>
|=----------------------[ Phrack Hello World ]=--------------------------=|

--[ Phrack Hello World

This is ascii text from my article. Markdown tags don't work here because
we are INSIDE a PRE-block.

Here is a code block which we like to syntax highlight:
</PRE>
```C
#include <stdio.h>
```
<PRE>

We inserted the code block between the </PRE> .. <PRE>.

--[ 6. References
All links will go into one use </PRE> block. Enumartion starts with 0.
 
</PRE>
0. [https://github.com/gin-gonic/gin](https://github.com/gin-gonic/gin)
1. [https://github.com/jackc/pgx](https://github.com/jackc/pgx)
1. [https://github.com/jackc/pgx/issues/1090](https://github.com/jackc/pgx/issues/1090)
<PRE>

|=[ EOF ]=---------------------------------------------------------------=|
</PRE>
````




