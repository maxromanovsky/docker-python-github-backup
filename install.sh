#!/usr/bin/env sh
if [ -z "$VERSION" ]; then
    pip install --prefix="/install" github-backup
else
    pip install --prefix="/install" github-backup==$VERSION
fi
