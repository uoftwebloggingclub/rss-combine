#!/bin/bash

cp /tmp/feed.xml ./feed.xml

git config user.name "GitHub Actions Bot"
git config user.email "<>"
git add feed.xml
git commit -m "Automated RSS update"

diff=$(git diff --shortstat HEAD~ HEAD | awk '{ print $4 }') # Number of lines added
if [ "$diff" -gt "1" ]; then
    git push origin main
else
    echo "No real updates!"
fi