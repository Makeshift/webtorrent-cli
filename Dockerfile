FROM node:alpine

WORKDIR /app

RUN apk add git && \
    git clone https://github.com/Makeshift/webtorrent-cli.git . && \
    npm install

EXPOSE 8000

ENTRYPOINT [ "node", "bin/cmd.js" ]