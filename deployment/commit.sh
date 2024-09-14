#!/bin/sh

oldVer=v6
newVer=v7

git stash
# git reset --hard
git fetch origin
git pull

sed -i "s/${oldVer}/${newVer}/g" ../.github/workflows/docker-build-push.yml
sed -i "s/${oldVer}/${newVer}/g" backend-feed-deployment.yaml
sed -i "s/${oldVer}/${newVer}/g" backend-user-deployment.yaml
sed -i "s/${oldVer}/${newVer}/g" frontend-deployment.yaml
sed -i "s/${oldVer}/${newVer}/g" reverseproxy-deployment.yaml

git add .

git commit -m "Build $newVer"
git push

# git stash pop