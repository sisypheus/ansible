#!/bin/bash

docker build -t ansible-test-image .

docker run -d --name ansible-test-container -p 2222:22 ansible-test-image

sleep 5

ansible-playbook -i inventory.ini setup.yaml

# docker stop ansible-test-container
# docker rm ansible-test-container
