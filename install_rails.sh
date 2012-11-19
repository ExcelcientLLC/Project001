#! /usr/bin/bash

install="sudo apt-get install"

sudo apt-get update
$install g++
$install libsqlite3-dev
$install ruby1.9.1-dev
sudo gem install rails
sudo gem install sqlite3
