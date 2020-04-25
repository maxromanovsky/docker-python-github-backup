# Multi-arch Docker image for github-backup

[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/maxromanovsky/docker-python-github-backup)](https://github.com/maxromanovsky/docker-python-github-backup)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/maxromanovsky/python-github-backup)](https://hub.docker.com/r/maxromanovsky/python-github-backup)
![Docker Image (latest) CI](https://github.com/maxromanovsky/docker-python-github-backup/workflows/Docker%20Image%20(latest)%20CI/badge.svg)
![Docker Image (release) CI](https://github.com/maxromanovsky/docker-python-github-backup/workflows/Docker%20Image%20(release)%20CI/badge.svg)

Source code repo: [josegonzalez/python-github-backup](https://github.com/josegonzalez/python-github-backup)

## Usage
```bash
docker run --rm -e GITHUB_USERNAME=maxromanovsky -e GITHUB_TOKEN=gh_token -e GITHUB_USER_TO_BACKUP=maxromanovsky -v "/Users/max/Downloads/gh:/out" maxromanovsky/python-github-backup:latest
```

## Configuration

| Environment variable name | Description | Defaults |
|-------------------------|-----------|--------|
| `GITHUB_USERNAME` | Github username for auth | |
| `GITHUB_TOKEN` | [Personal access token](https://github.com/settings/tokens) for auth | |
| `GITHUB_USER_TO_BACKUP` | Github user whose repositories should be backed up | |
| `BACKUP_OPTIONS` |`github-backup` [options](https://github.com/josegonzalez/python-github-backup#usage) | `--repositories --gists -P -F --bare` |
| `DIR_DESTINATION` | Backup destination directory | `/out` |

## Building locally

### Using `docker buildx`

```bash
export GITHUB_BACKUP_VERSION=0.33.0
docker buildx build --platform linux/amd64,linux/arm/v7 --build-arg VERSION=$GITHUB_BACKUP_VERSION -t maxromanovsky/python-github-backup:v${GITHUB_BACKUP_VERSION} --push .
```

### Using Github Actions
```bash
brew install nektos/tap/act
act -P ubuntu-latest=phaze9/action-runner -s DOCKER_USERNAME=maxromanovsky -s DOCKER_PASSWORD=docker-personal-access-token
```
