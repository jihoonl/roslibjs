#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

checkout_and_commit() {
  echo "Checking out branch: ${TRAVIS_BRANCH}"
  git checkout ${TRAVIS_BRANCH}
  echo "Add built module"
  git add build/roslib.js
  git add build/roslib.min.js
  git commit build/roslib.js build/roslib.min.js -m "Update built module"
}

push() {
  echo "Add Remote"
  git remote add pr_origin https://${GITHUB_API_KEY}@github.com/${TRAVIS_PULL_REQUEST_SLUG}.git > /dev/null 2>&1
  echo "Push"
  git push --quiet --set-upstream pr_origin ${TRAVIS_BRANCH}
}

echo "Hello World"
echo "Event Type : ${TRAVIS_EVENT_TYPE}"
echo "Travis branch : ${TRAVIS_BRANCH}"
echo "TRAVIS Pull reqt: ${TRAVIS_PULL_REQUEST}"
echo "SLUG : ${TRAVIS_PULL_REQUEST_SLUG}"
setup_git
checkout_and_commit
push

echo "After push"
