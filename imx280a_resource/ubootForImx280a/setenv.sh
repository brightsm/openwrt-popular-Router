#!/bin/bash


export TOP_DIR=${GITHUB_WORKSPACE}
export WORK_BASE=${TOP_DIR}/u-boot-v2020.7-rc4
export ARCH=arm
export CROSS_COMPILE=arm-926ejs-linux-gnueabi-
#export CROSS_COMPILE=arm-fsl-linux-gnueabi-
export CROSS_COMPILE_DIR=${TOP_DIR}/x-tools/arm-926ejs-linux-gnueabi/bin
#export CROSS_COMPILE_DIR=${WORK_BASE}/toolchain/arm-fsl-linux-gnueabi/bin
export PATH=${CROSS_COMPILE_DIR}:$PATH
#设置elftosb的路径
export elftosb_PATH=${TOP_DIR}/elftosb/bld/linux
export PATH=${elftosb_PATH}:$PATH
