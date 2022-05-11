# Docker Images for BASE

## Creating new Images

* If your new image is compatible with the previous image then increment the minor number. eg `1.1` > `1.2`
* If your new image is not compatible, then increment the major number eg `1.1` > `2.0`

## Building / Pushing Images

* Build: `base build <image> <tag>`
* Push: `base push <image> <tag>`


## Remote Commands
* `sudo apt-get clean`
* `sudo docker image ls` - Lists all images on remote
* `sudo docker image prune -a` - This will remove all images without at least one container associated to them.
* `docker system prune` This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all dangling images
        - all build cache