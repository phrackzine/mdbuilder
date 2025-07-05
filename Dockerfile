FROM ubuntu

############################################################################
# If you are an AUTHOR then you are wrong here. You NEVER EVER
# need to build from the Dockerfile (==>>> you can not build it).
# Instead use:
#  docker run --rm -p8080:80 -v$(pwd):/src:ro -it phrackzine/mdbuilder
############################################################################


# Location of the phrack.org web source code (css files etc)
ARG WWWSRC=phrack.org

# docker build -t phrack.org-mdbuilder .
# docker run --rm --name phrack -p8080:80 -v$(pwd):/src:ro -it phrack-mdbuilder
# http://localhost:8080/issues/0/0.html

WORKDIR /phrack.org

RUN mkdir -p templates _site/issues/0 \
    && mkdir -p issues/0 \
    && ln -s /src/article.md issues/0/0.md \
    && ln -s issues/0/0_md.html _site/index.html \
    && ln -s . _site/md \
    && cat >issues/0/meta.md <<"EOF"
---
date: 1970-13-13
author: AuthorSetLater
---
EOF

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        inotify-tools \
        nginx \
        python3 \
        python3-markdown \
        python3-pygments \
        vim \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

COPY ${WWWSRC}/templates/default.html ${WWWSRC}/templates/issue.html ${WWWSRC}/templates/tocitem.html ./templates/
COPY ${WWWSRC}/Makemd.py .
COPY ${WWWSRC}/images _site/images
COPY ${WWWSRC}/css _site/css
COPY nginx.conf /config/nginx.conf
COPY start.sh /
CMD exec bash /start.sh
