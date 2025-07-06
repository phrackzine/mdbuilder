#! /bin/bash

nginx -c /config/nginx.conf

CB="\e[1;34m" # blue
CDR="\e[0;31m" # red
CDY="\e[0;33m" # yellow
CDC="\e[0;36m" # cyan
CUL="\e[4m"
CN="\e[0m"    # none

[ ! -f /src/article.md ] && {
	echo -e >&2 "${CDR}ERROR:${CN} Not found: article.md
Please make sure that your current working directory contains your article
and is named ${CDC}article.md${CN}.

Example articles:
${CB}${CUL}https://github.com/phrackzine/mdbuilder/tree/main/examples${CN}"
	exit 255
}

python3 ./Makemd.py

echo -e ">>> View your article at ${CB}${CUL}http://localhost:8080${CN}."
echo "Keep editing your article.md file. The HTML will be updated automatically."
while :; do
	sleep 5
	inotifywait issues/0/0.md -e MODIFY,DELETE_SELF || continue
	sleep 1
	python3 ./Makemd.py
	echo -e "[$(date)] View your article at ${CB}${CUL}http://localhost:8080${CN}"
done

