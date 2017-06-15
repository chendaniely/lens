# lens

`docker build -t archlens .`

`docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name archlens -d archlens tail -f /dev/null`

`xhost +local:root`

`docker exec -it archlens lens`

`xhost -local:root`



adapted from: http://wiki.ros.org/docker/Tutorials/GUI#The_simple_way

of interest: http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/