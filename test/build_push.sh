#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

pwd
echo "Hello World"
echo "branch : ${TRAVIS_BRANCH}"
git add build/roslib.js
git add build/roslib.min.js
git commit build/roslib.js build/roslib.min.js -m "Test"
git push

echo "After push"
