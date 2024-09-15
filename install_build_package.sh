#!/bin/bash 
package_list=(autoconf automake bc binutils binutils-gold  bison build-essential bzip2 cmake curl device-tree-compiler \
    dpkg-dev flex g++ gcc glibtool git gperf help2man imagemagick libssl-dev libtool libtool-bin linux-kernel-headers m4 make ncurses-dev \
    patch perl python3-pip quilt swig texinfo unzip xz-utils)

install_error=0
install_log=/tmp/build_package_install.log

sudo python3 -m pip install setuptools

echo "==============================" > $install_log
sudo apt-get update

for p in "${package_list[@]}"; do
    echo "============================="
    echo "Installing package <$p> ..."
    sudo apt-get install -y $p >> $install_log
    install_error="$?"
    if [[ "$install_error" == "0" ]]; then
        echo "Package <$p> install success!"
    else
        echo "Package <$p> install error!"
    fi
done

echo "Package install over, See log at $install_log"
