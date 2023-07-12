FROM alpine/git:v2.30.2

RUN apk --no-cache add bash

COPY ./semver.sh /usr/local/bin/semver

WORKDIR /code

USER 1000

ENTRYPOINT [ "semver" ]