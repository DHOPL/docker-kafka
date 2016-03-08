# kafka on mesos docker image
This image is build according [official kafka on mesos doc](https://github.com/mesos/kafka/tree/5b13c4e782476bec7776dae6a17d5ded770c0bb7/src/docker)

But above doc have some issues by 2016.3.8.

So if you want to build this yourself,pay attention to the following notes:
1. add env for `TERM`.For example:`export TERM=linux` in you dockerfile
