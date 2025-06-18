#!/bin/bash

if grep "No real updates!" /tmp/publish.log
then
    exit 0
fi

git config user.name "GitHub Actions Bot"
git config user.email "<>"
git commit --allow-empty -m "Automated RSS update"

git push origin rss-update