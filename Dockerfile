#
# using deck as base image so it can be reused
#
FROM node:12

RUN npm install --unsafe-perm -g insomnia-inso

# also installs deck for convenience
RUN curl -sL https://github.com/kong/deck/releases/download/v1.8.2/deck_1.8.2_linux_amd64.tar.gz -o deck.tar.gz && \
 mkdir -p /tmp/deck && \
 tar -xf deck.tar.gz -C /tmp/deck && \
 cp /tmp/deck/deck /usr/local/bin/ && \
 rm deck.tar.gz && \
 rm -Rf /tmp/deck

# also kubectl for convenience
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
 chmod +x ./kubectl && \
 mv ./kubectl /usr/local/bin/kubectl

# also kong portal cli
RUN npm install -g kong-portal-cli

CMD [ "bash" ]

RUN mkdir -p /app/src && \
    chown node:node /app/src

USER node
WORKDIR /app/src

