#!/usr/bin/env bash
#
# Run our grunt image (see grunt-build.sh)
#   - bind/map in ONLY our theme folder (no need for the rest)
#   - run the command in the theme folder
#  * the rest is as defined in the image (see Dockerfile)
#

GRUNT_PATH=$(pwd)/$1

docker run --rm -t -i \
  --volume=${GRUNT_PATH}:/app/project \
  -w=/app/project \
  grunt-watch

