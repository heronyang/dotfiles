#!/bin/sh

# Turns on command printing
set -x

# Sets up the coloring part in part
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

function backup {
    echo "${BLUE}Backing up the dotfiles${NC}"
    source config
    for i in "${dotfiles[@]}"
    do
        if [ -e $f ]
        then
            cp "$1/$i" $2
        else
            echo "${RED}Not found $f${NC}"
        fi
    done
    echo "${GREEN}Dotfiles backed up${NC}"
}

from=$HOME
to="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
backup $from $to
