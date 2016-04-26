#!/usr/bin/env bash
#
# Run our grunt image (see grunt-build.sh)
#   - bind/map in ONLY our theme folder (no need for the rest)
#   - run the command in the theme folder
#  * the rest is as defined in the image (see Dockerfile)
#


GRUNT_PATH="$(pwd)"

if [ ! -f "${GRUNT_PATH}/Gruntfile.js" ]; then
	echo "No gruntfile found in provided path.  Expected: ${GRUNT_PATH}/Gruntfile.js"
	exit 1
fi

docker run --rm -t -i \
  --volume=${GRUNT_PATH}:/app/project \
  -w=/app/project \
  grunt-watch

