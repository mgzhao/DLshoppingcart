Examples
----------------

#### Setup

Log in:

```bash
ssh phendricks@psglogin
srun --comment="docker" -t 2:00:00 --pty bash -i
```

Figure out IP address:

```bash
ip address show | grep eno1 | grep inet
```

Launch docker:

```bash
nvidia-docker run -it -d -p 8888:8888 -u $(id -u):$(id -g) -e HOME=/home/$USER -v /home/$USER:/home/$USER nvcr.io/nvidian_sas/ph_pytorch_notebook --notebook-dir=/home/$USER/projects/DeepRecommender
NV_GPU=0 nvidia-docker run -it -d -p 8888:8888 -u $(id -u):$(id -g) -e HOME=/home/$USER -v /home/$USER:/home/$USER nvcr.io/nvidian_sas/ph_pytorch_notebook --notebook-dir=/home/$USER/projects/DeepRecommender
```

The below may be optional. This will print an Image ID to the screen. Let's use it to check logs for token:

```bash
docker logs <image_id>
```

Open notebook at `http://<ip_address>:8888/` and enter the token from logs.

To log in to the existing image:

```bash
docker exec -it <image_id> bash
```

To clean up:

```bash
docker stop <image_id>
```
