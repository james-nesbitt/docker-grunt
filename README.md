# docker-grunt

A quick attempt at creating a docker based script for running grunt to compile sass->css
without needing to locally install any nodejs


## usage

first build the image:
````
./grunt-build.sh
````
Then run the tool
````
./grunt.sh ${path_to_where_the_sass_is}
````
