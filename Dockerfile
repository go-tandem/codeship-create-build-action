FROM alpine:latest

LABEL "com.github.actions.name"="Codeship Trigger Build"
LABEL "com.github.actions.description"="Creates a build for a Codeship project"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="red"

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    jq

COPY create-codeship-build.sh /usr/bin/create-codeship-build

ENTRYPOINT ["create-codeship-build"]