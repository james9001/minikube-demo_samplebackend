#!/bin/bash

sudo docker build -t hostmachine:5000/minikube-demo_samplebackend:latest .
sudo docker push hostmachine:5000/minikube-demo_samplebackend:latest
