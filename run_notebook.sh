#!/usr/bin/env bash

IMAGE_ID=`nvidia-docker run -it -d -p 8888:8888 -u $(id -u):$(id -g) -e HOME=/home/$USER -v /home/$USER:/home/$USER nvcr.io/nvidian_sas/ph_pytorch_notebook --notebook-dir=/home/$USER/projects/dli-deep-recommender`
IP_ADDRESS=`ip address show | grep eno1 | grep inet | awk '{print $2}' | awk -F/ '{print $1}'`
echo "Please run: docker logs $IMAGE_ID | sed "s/0.0.0.0/$IP_ADDRESS/g""
