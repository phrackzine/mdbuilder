FROM alpine

############################################################################
# If you are an AUTHOR then you are wrong here. You NEVER EVER
# need to build from the Dockerfile (==>>> you can not build it).
# Instead use:
#  docker run --rm -p8080:80 -v$(pwd):/src:ro -it phrackzine/mdbuilder
############################################################################


# Location of the phrack.org web source code (css files etc)
ARG WWWSRC=phrack.org

# docker build -t phrackzine/mdbuilder .
# docker run --rm --name phrack -p8080:80 -v$(pwd):/src:ro -it phrackzine/mdbuilder
# http://localhost:8080

WORKDIR /phrack.org

RUN mkdir -p templates _site/issues/0 \
    && mkdir -p issues/0 \
    && ln -s /src/article.md issues/0/0.md \
    && ln -s issues/0/0_md.html _site/index.html \
    && ln -s . _site/md \
    && ln -s /src/dl _site/dl \
    && cat >issues/0/meta.md <<"EOF"
---
date: 1970-13-13
author: AuthorSetLater
---
EOF

RUN apk add --no-cache \
        bash \
        inotify-tools \
        nginx \
        python3 \
        py3-markdown \
        py3-pygments \
        vim 
    
COPY ${WWWSRC}/templates/default.html ${WWWSRC}/templates/issue.html ${WWWSRC}/templates/tocitem.html ./templates/
COPY ${WWWSRC}/Makemd.py .
COPY ${WWWSRC}/images _site/images
COPY ${WWWSRC}/css _site/css
COPY nginx.conf /config/nginx.conf
COPY start.sh /
CMD exec bash /start.sh
