#!/bin/bash

apm install $(cat packages.txt)

mkdir -p ~/.atom

function install () {
  if [ -e "$HOME/.atom/$1" ]; then
    read -r -p "Found existing $1. Do you want to overwrite? (y/N) " response

    if [[ "$response" =~ ^[Yy]$ ]]; then
      cp $1 ~/.atom
      echo "  wrote $1"
    fi
  fi
}

install "keymap.cson"
install "config.cson"
