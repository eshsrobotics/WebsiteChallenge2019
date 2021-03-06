#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

git checkout master
git merge dev
git push origin master

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push -f https://github.com/eshsrobotics/website-challenge-2019.git master:gh-pages

cd -

git checkout dev
