#! /bin/bash

nginx -c /config/nginx.conf

CB="\e[1;34m" # blue
CDR="\e[0;31m" # red
CDY="\e[0;33m" # yellow
CDC="\e[0;36m" # cyan
CUL="\e[4m"
CF="\e[2m"    # faint
CN="\e[0m"    # none

ls -- /src/*.md &>/dev/null || {
		echo -e >&2 "${CDR}ERROR:${CN} No [0-9]*.md found.
Please make sure that your current working directory contains your article.

Example articles:
${CB}${CUL}https://github.com/phrackzine/articles/tree/main/examples${CN}"
	exit 255
}

old=0
while :; do
	sleep 1
	fn="$(ls -rt -- /src/[0-9]*.md 2>/dev/null | grep -vF meta.md | tail -n1)"
	[ -z "$fn" ] && continue
	now=$(stat -c "%Y" "$fn")
	[ "$now" -le "$old" ] && continue
	old="$now"

	ln -sf "$fn" issues/0/0.md
	echo -e " ${CF}${fn##*/} -> $(python3 ./Makemd.py)${CN}"
	echo -e "[$(date)] View ${CDY}${fn##*/}${CN} at ${CB}${CUL}http://localhost:8080${CN}"
done