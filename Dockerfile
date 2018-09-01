FROM ubuntu:16.04

# Update ubuntu
RUN set -x \
 && cd \
 && apt clean \
 && sed -i'~' -E "s@http://(..\.)?archive\.ubuntu\.com/ubuntu@http://pf.is.s.u-tokyo.ac.jp/~awamoto/apt-mirror/@g" /etc/apt/sources.list \
 && apt update \
 && apt install -y \
                wget \
		texlive-latex-recommended \
		xvfb \
		libfontconfig \
		wkhtmltopdf \
 && apt clean \
 && rm -rf /var/lib/apt/lists/* \
 && apt -qy autoremove
RUN wget -q https://github.com/jgm/pandoc/releases/download/2.2.1/pandoc-2.2.1-1-amd64.deb \
 && dpkg -i pandoc-2.2.1-1-amd64.deb

VOLUME /workspace
WORKDIR /workspace