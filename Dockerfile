FROM nvcr.io/nvidia/pytorch:17.12

# ========== Update ==========
#RUN apt-get update && apt-get -y install curl

# ========== Create user ==========
RUN groupadd -r user && useradd -r -g user user

# ========== Create working directory ==========
RUN mkdir /home/user/
RUN mkdir /home/user/project
WORKDIR /home/user/project

# ========== Mount volume ==========
# ADD ./requirements.txt ./requirements.txt

# ========== Install packages ==========
RUN pip install tensorflow

# ========== Set command ==========
CMD /bin/bash
