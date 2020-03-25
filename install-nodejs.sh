#!/bin/bash

# Vars
cmd1=$(node --version)
cmd2=$(npm --version)

# Colors
BOLD="$(tput bold 2>/dev/null || echo '')"
GREY="$(tput setaf 0 2>/dev/null || echo '')"
UNDERLINE="$(tput smul 2>/dev/null || echo '')"
RED="$(tput setaf 1 2>/dev/null || echo '')"
GREEN="$(tput setaf 2 2>/dev/null || echo '')"
YELLOW="$(tput setaf 3 2>/dev/null || echo '')"
BLUE="$(tput setaf 4 2>/dev/null || echo '')"
MAGENTA="$(tput setaf 5 2>/dev/null || echo '')"
CYAN="$(tput setaf 6 2>/dev/null || echo '')"
NO_COLOR="$(tput sgr0 2>/dev/null || echo '')"

# Color functions
function greenMessage() {
  echo -e "\\033[32;1m${*}\\033[0m"
}

function magentaMessage() {
  echo -e "\\033[35;1m${*}\\033[0m"
}

function cyanMessage() {
  echo -e "\\033[36;1m${*}\\033[0m"
}

function redMessage() {
  echo -e "\\033[31;1m${*}\\033[0m"
}

function yellowMessage() {
  echo -e "\\033[33;1m${*}\\033[0m"
}

function errorQuit() {
  errorExit 'A sair!'
}

function errorExit() {
  redMessage "${@}"
  exit 1
}

function errorContinue() {
  redMessage "> Invalid Choose."
  return
}

# Start

# Check if sudo is installed
if [ "$(dpkg -l | awk '/sudo/ {print }'|wc -l)" -ge 1 ]; then
  yellowMessage "> Sudo: OK"
else
  apt-get install sudo
fi


# Check if curl is installed
if [ "$(dpkg -l | awk '/curl/ {print }'|wc -l)" -ge 1 ]; then
  yellowMessage "> Curl: OK"
else
  sudo apt-get install curl
fi

# Install NPM & NodeJS
magentaMessage "Do you wish to continue? [Y/n]"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then

    clear
    curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
 
    # Check if npm is already installed
    if [ "$(dpkg -l | awk '/build-essential/ {print }'|wc -l)" -ge 1 ]; then
        redMessage "> NPM is already installed\nAborting!"
        sleep 1
        clear
        echo ""
        echo ""
        redMessage "#######################################################"
        redMessage "#############                             #############"
        redMessage "#                     DEVELOPED BY                    #"
        redMessage "#                github.com/ShutAP1337                #"
        redMessage "#############                             #############"
        redMessage "#######################################################"
        echo ""
        echo ""
        greenMessage "NodeJS & NPM installed sucessfully."
        cyanMessage "Actual Version: $cmd1" 
        cyanMessage "Actual Version: (NPM): $cmd2"
        echo ""
        greenMessage "                Liked it? Give a star :3"
        redMessage "      https://github.com/ShutAP1337/install-nodejs"
        echo ""
        exit 1
    else
        sudo apt-get install build-essential nodejs
    fi
else
    redMessage "Aborted."
    exit 1
fi