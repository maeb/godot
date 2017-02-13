# Continuous integration with Godot Engine
## Automate Godot Engine builds using Docker, Vagrant and Gitlab CI

The ```Dockerfile``` is the source of the automated build at  https://hub.docker.com/r/skaterase/godot/.

The ```Vagrantfile``` provides Docker and Gitlab Runner. It can be used to test the Gitlab CI configuration (see ```.gitlab-ci.yml```):

    $ gitlab-runner exec docker <job name>

    No need to register the runner first.

    ### Credits
    Rafał Zawadzki: https://hub.docker.com/r/bluszcz/godot/
