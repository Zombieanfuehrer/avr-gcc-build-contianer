# AVR-GCC-Conan-CMake Docker Image

![Docker Pulls](https://img.shields.io/docker/pulls/zombieanfuehrer/avr-gcc-conan-cmake)
![Docker Stars](https://img.shields.io/docker/stars/zombieanfuehrer/avr-gcc-conan-cmake)
![GitHub last commit](https://img.shields.io/github/last-commit/Zombieanfuehrer/avr-gcc-build-contianer)
![GitHub workflow status](https://img.shields.io/github/actions/workflow/status/Zombieanfuehrer/avr-gcc-build-contianer/docker-publish.yml)

## Description

This repository contains a Dockerfile which creates a build container image, this is used to create C/C++ firmware for AVR-ATmega328. 
In addition, the container uses Conan and CMake as a build tool to support modern development standards. It is useful for developing and building AVR projects in a consistent and isolated environment, bringing CI/CD techniques into the world of microcontroller programming.

## Usage

In general, this Contianer image is for a server build which is executed via GitHub Action or GitLab Pipeline.

### Prerequisites

- Docker must be installed on the build system. Installation instructions can be found [here](https://docs.docker.com/get-docker/).

### License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

David A. Haufe