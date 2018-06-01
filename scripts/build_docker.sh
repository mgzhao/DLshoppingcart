#!/usr/bin/env bash

docker build -t nvcr.io/nvidian_sas/ph_deep_recommender .
docker push nvcr.io/nvidian_sas/ph_deep_recommender
docker pull nvcr.io/nvidian_sas/ph_deep_recommender
