FROM crystallang/crystal:1.1.1-alpine as builder

ENV HOME=/app
WORKDIR $HOME

COPY shard.yml shard.lock ./

RUN shards install --static --release --production

COPY . ./

RUN shards build server --static --release --stats

FROM alpine:3.14.1 as app

ENV HOME=/app
WORKDIR $HOME

COPY --from=builder $HOME/bin/server ./server

CMD ./server
