#!/bin/bash

docker-compose up -d --build
docker-compose exec server bash -c "rm -rf build"
docker-compose exec server bash -c "python3.6 ./setup.py build && \
                                    python3.7 ./setup.py build && \
                                    python3.8 ./setup.py build && \
                                    tox"
docker-compose down
