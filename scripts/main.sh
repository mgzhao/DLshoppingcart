#!/usr/bin/env bash

ssh phendricks@psglogin
allocate
srun --comment="docker" -t 8:00:00 --pty bash -i
srun --comment="docker" -t 8:00:00 -p hsw_v100 --pty bash -i
nvidia-docker run -it -d -p 8888:8888 -p 6006:6006 -u $(id -u):$(id -g) -e HOME=/home/$USER -v /home/$USER:/home/$USER nvcr.io/nvidian_sas/ph_pytorch_notebook:18.01-py3 --notebook-dir=/home/$USER/projects/dli-deep-recommender
NV_GPU=0 nvidia-docker run -it -d -p 8888:8888 -p 6006:6006 -u $(id -u):$(id -g) -e HOME=/home/$USER -v /home/$USER:/home/$USER nvcr.io/nvidian_sas/ph_pytorch_notebook:18.01-py3 --notebook-dir=/home/$USER/projects/dli-deep-recommender
nvidia-docker run -it -d -p 8888:8888 -p 6006:6006 nvcr.io/nvidian_sas/ph_pytorch_notebook:18.01-py3

ip address show | grep eno1 | grep inet
#docker logs <image_id>
#docker exec -it <image_id> bash
#docker stop <image_id>

