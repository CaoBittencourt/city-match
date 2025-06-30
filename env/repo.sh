#!/bin/bash

git init --initial-branch master
git add .
git commit -m 'created repo'
git tag 0.0.1
git remote add origin "https://github.com/CaoBittencourt/city-match.git"
git push -u --tags origin master

git checkout -b dev master
git push -u origin dev
