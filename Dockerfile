FROM python:alpine as builder

ARG VERSION
RUN pip install --prefix="/install" github-backup==$VERSION

FROM python:alpine

COPY --from=builder /install /usr/local

RUN apk add --update --no-cache git

ENV GITHUB_USERNAME = "github"
ENV GITHUB_TOKEN "foo"
ENV GITHUB_USER_TO_BACKUP = "github"
ENV BACKUP_OPTIONS "--repositories --gists -P -F --bare"
ENV DIR_DESTINATION "/out"
ENV PYTHONUNBUFFERED "1" # unbuffered stdout

CMD github-backup -u $GITHUB_USERNAME -t $GITHUB_TOKEN $BACKUP_OPTIONS -o $DIR_DESTINATION $GITHUB_USER_TO_BACKUP
