#!/bin/bash

apt-get update
apt-get dist-upgrade
apt-get install -y vim git curl wget tar maven

# Install autotools (Only necessary if building from git repository).
apt-get install -y autoconf libtool


