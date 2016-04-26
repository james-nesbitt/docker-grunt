# GRUNT image
#
# This image adds grunt globally using npm, then
#

# this is a base centos image that has a user APP=1000:1000 already created, and has an /app folder
# if you don't use this image (and USER app) then you may have to manage permissions issues after 
# compiling, as the root user may be used to compile sass->css
FROM jamesnesbitt/wunder-base

# Install nodejs and npm
RUN /usr/bin/yum install --assumeyes --verbose nodejs npm
# Install required grunt stuff globally
RUN /usr/bin/npm install grunt-cli -g
RUN /usr/bin/npm install grunt -g

# not sure if this is necessary
RUN /usr/bin/npm update --save-dev

# Get a non-root user to run grunt, by default using the watch operation
#
USER app                 # What you need here is a user with uid 1000, which likely matches your OSX uid
ENTRYPOINT ["grunt"]     # This image always runs "grunt"
CMD ["watch"]            # this CMD can be overriden on command line if you have other operations you may use
