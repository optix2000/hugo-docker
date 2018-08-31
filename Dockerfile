FROM alpine AS download

ARG VERSION=0.48

ADD https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz /hugo.tar.gz
RUN tar -zxvf hugo.tar.gz
RUN ["/hugo", "version"]

FROM alpine

COPY --from=download /hugo /bin/hugo
