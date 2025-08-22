#!/bin/bash

ssh-keygen -q -t rsa -N '' -f ./id_rsa_ans <<<y 2>&1 >/dev/null
docker build -t docker-ansible:11.1.0-alpine-3.21
docker run --rm -it docker-ansible ansible --version

