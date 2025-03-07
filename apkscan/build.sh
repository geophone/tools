#!/usr/bin/env zsh
docker build -t a .
docker run -v .:/output -it a

