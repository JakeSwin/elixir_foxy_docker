#!/bin/bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source /opt/ros/foxy/setup.bash
export PATH=/home/swin/.mix/escripts:$PATH
/bin/bash
