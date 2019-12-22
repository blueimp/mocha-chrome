FROM blueimp/chromedriver

USER root

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install --no-install-recommends --no-install-suggests -y \
    nodejs \
    npm \
    netcat \
  # Remove obsolete files:
  && npm install -g \
    npm@latest \
    mocha-chrome \
  && apt-get clean \
  && rm -rf \
    /root/.npm \
    /tmp/* \
    /usr/share/doc/* \
    /var/cache/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

COPY wait-for-hosts.sh /usr/local/bin/wait-for-hosts

USER webdriver

WORKDIR /var/www/html

ENV DISABLE_X11=true

ENTRYPOINT ["entrypoint", "wait-for-hosts", "--", "mocha-chrome"]
