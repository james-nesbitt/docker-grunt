#!/usr/bin/env bash
#
# Run our grunt image (see grunt-build.sh)
#   - bind/map in ONLY our theme folder (no need for the rest)
#   - run the command in the theme folder
#  * the rest is as defined in the image (see Dockerfile)
#

if [ -z "${1}" ]; then
	echo "usage: grunt.sh {PATH}"
	exit 1
fi

GRUNT_PATH=$(pwd)/$1

if [ ! -d "${GRUNT_PATH}" ]; then
	echo "No valid path was provided: ${GRUNT_PATH} does not exist"
	exit 1
fi
if [ ! -f "${GRUNT_PATH}/Gruntfile.js" ]; then
	echo "No gruntfile found in provided path.  Expected: ${GRUNT_PATH}/Gruntfile.js"
	exit 1
fi

docker run --rm -t -i \
  --volume=${GRUNT_PATH}:/app/project \
  -w=/app/project \
  grunt-watch

