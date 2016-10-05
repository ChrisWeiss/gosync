FROM alpine:3.4
MAINTAINER Lucas do Amaral Saboya <lucas.saboya@anki.com>
RUN apk update &&\
    apk upgrade &&\
    apk add ca-certificates &&\
    update-ca-certificates &&\
    rm -rf /var/cache/apk/*
ADD ./bin/gosync /gosync
CMD ["./gosync"]
