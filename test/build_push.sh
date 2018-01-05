#!/bin/sh


setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

pwd
echo "Hello World"
