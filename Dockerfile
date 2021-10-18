#
# using deck as base image so it can be reused
#
FROM node:12

RUN npm install --unsafe-perm -g insomnia-inso

# also installs deck for convenience
RUN curl -sL https://github.com/kong/deck/releases/download/v1.8.2/deck_1.8.2_linux_amd64.tar.gz -o deck.tar.gz && \
 tar -xf deck.tar.gz -C /tmp && \
 cp /tmp/deck /usr/local/bin/

CMD [ "bash" ]

RUN mkdir -p /app/src && \
    chown node:node /app/src

USER node
WORKDIR /app/src

