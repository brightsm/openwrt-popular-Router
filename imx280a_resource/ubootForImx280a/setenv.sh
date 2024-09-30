#!/bin/bash

# 检查 GITHUB_WORKSPACE 是否已定义
if [ -z "${GITHUB_WORKSPACE}" ]; then
    echo "Error: GITHUB_WORKSPACE is not set."
    exit 1
fi

# 设置顶层目录
export TOP_DIR=${GITHUB_WORKSPACE}

# 设置工作基目录
export WORK_BASE=${TOP_DIR}/u-boot-v2020.7-rc4

# 设置架构
export ARCH=arm

# 设置交叉编译工具链前缀
export CROSS_COMPILE=arm-926ejs-linux-gnueabi-
# export CROSS_COMPILE=arm-fsl-linux-gnueabi-

# 设置交叉编译工具链目录
export CROSS_COMPILE_DIR=${TOP_DIR}/armv5te-arm926ejs-build/x-tools/arm-926ejs-linux-gnueabi/bin
# export CROSS_COMPILE_DIR=${WORK_BASE}/toolchain/arm-fsl-linux-gnueabi/bin

# 将交叉编译工具链目录添加到 PATH
export PATH=${CROSS_COMPILE_DIR}:$PATH

# 设置 elftosb 的路径
export elftosb_PATH=${TOP_DIR}/elftosb/bld/linux

# 将 elftosb 路径添加到 PATH
export PATH=${elftosb_PATH}:$PATH

# 检查路径是否存在
if [ ! -d "${WORK_BASE}" ]; then
    echo "Error: WORK_BASE directory ${WORK_BASE} does not exist."
    exit 1
fi

if [ ! -d "${CROSS_COMPILE_DIR}" ]; then
    echo "Error: CROSS_COMPILE_DIR directory ${CROSS_COMPILE_DIR} does not exist."
    exit 1
fi

if [ ! -d "${elftosb_PATH}" ]; then
    echo "Error: elftosb_PATH directory ${elftosb_PATH} does not exist."
    exit 1
fi

echo "Environment setup complete."
