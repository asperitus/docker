#!/bin/bash

cd $HOME

#
Xvfb :10 -screen 0 1024x768x24 &
export DISPLAY=:10

#
npm install

webdriver-manager start &

#
sleep 10

echo 'Running Test $@...'

protractor $@
#