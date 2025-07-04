#! /bin/bash

nginx -c /config/nginx.conf

CB="\e[1;34m" # blue
CDR="\e[0;31m" # red
CDY="\e[0;33m" # yellow
CDC="\e[0;36m" # cyan
CUL="\e[4m"
CN="\e[0m"    # none

[ ! -f issues/0/0.md ] && {
	echo -e >&2 "${CDR}ERROR:${CN} Not found: article.md
Please make sure that your current working directory contains your article
and is named ${CDC}article.md${CN}.

Your ${CDC}article.md${CN} must be of this format:${CDY}
---
title: A
author: B
---
<PRE>${CN}
...your .TXT article here.
${CDY}</PRE>${CN}

Tips:
- Convert all < to &lt; and all & to &amp;
- Exit the PRE-block when you like to use Markdown:
Example 1 - To use a python code block, use:${CDY}
</PRE>
\`\`\`python
...Your code here
\`\`\`
<PRE>${CN}

Example 2 - A Reference section:${CDY}
</PRE>
0. [THC](https://www.thc.org)

1. [phrack homepage](https://www.phrack.org)

1. [Google](https://www.google.com)
<PRE>${CN}
"
	exit 255
}

python3 ./Makemd.py

echo ">>> View your article at ${CB}${CUL}http://localhost:8080${CN}"
while :; do
	sleep 5
	inotifywait issues/0/0.md -e MODIFY,DELETE_SELF || continue
	sleep 1
	python3 ./Makemd.py
done

