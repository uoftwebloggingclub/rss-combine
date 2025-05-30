#!/bin/bash

cp /tmp/feed.xml feed.xml

git config user.name "GitHub Actions Bot"
git config user.email "<>"
git add feed.xml
git commit -m "Automated RSS update"

added=$(git diff --shortstat HEAD~ HEAD | awk '{ print $4 }') # Number of lines added
subbed=$(git diff --shortstat HEAD~ HEAD | awk '{ print $6 }') # Number of lines subtracted

if [ "$added" -gt "1" ] || [ "$subbed" -gt "1" ]; then
    git push origin feed
else
    echo "No real updates!"
fi
