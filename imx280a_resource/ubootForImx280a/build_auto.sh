#!/bin/bash

# 定义函数
make_distclean() {
    echo "make distclean"
    make distclean
}

config_mx28() {
    make mx28evk_defconfig
}

build_uboot() {
    #make -j${NUM_CPUS} u-boot.sb
    make -j${NUM_CPUS} spl/u-boot-spl
    make -j${NUM_CPUS} u-boot
}

make_uboot_sb() {
    elftosb -f imx28 -c arch/arm/cpu/arm926ejs/mxs/u-boot-imx28.bd -o u-boot.sb
}

# 设置环境变量
source ./setenv.sh
NUM_CPUS=$(cat /proc/cpuinfo | grep -c processor)
TFTPBOOT=/home/work/tftpboot

# 自动执行所有步骤
echo "Automatically executing all steps..."
make_distclean
if [ $? -eq 0 ]; then
    config_mx28
    if [ $? -eq 0 ]; then
        build_uboot
        if [ $? -eq 0 ]; then
            make_uboot_sb
            if [ $? -ne 0 ]; then
                echo "Error during make_uboot_sb, aborting."
                exit 1
            fi
        else
            echo "Error during build_uboot, aborting."
            exit 1
        fi
    else
        echo "Error during config_mx28, aborting."
        exit 1
    fi
else
    echo "Error during make_distclean, aborting."
    exit 1
fi

echo "All steps completed successfully."
exit 0
