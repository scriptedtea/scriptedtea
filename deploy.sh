#!/usr/bin/env bash

cd _site
git add .
git commit -m "Deploy site"
git push origin gh-pages