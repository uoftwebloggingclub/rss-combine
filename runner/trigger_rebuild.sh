#!/bin/bash

if grep "No real updates!" /tmp/publish.log
then
    return
fi

git config user.name "GitHub Actions Bot"
git config user.email "<>"
git commit --allow-empty -m "Automated RSS update"

git push origin feed