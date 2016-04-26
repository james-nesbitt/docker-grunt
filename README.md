# docker-grunt

A quick attempt at creating a docker based script for running grunt to compile sass->css
without needing to locally install any nodejs


## usage

first build the image:
````
./grunt-build.sh
````

Then copy the grunt.sh to your grunt folder and run it
````
./grunt.sh
````

## Requirements

Right now the grunt.js script checks to see if you have a Gruntfile.js in your compile path
