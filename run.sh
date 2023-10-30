#!/bin/bash

sudo apt install make build-essential libncurses-dev bison flex libssl-dev libelf-dev cmake clang cpp gcc libncurses5 android-platform-tools git -y
cd ~/
git clone https://github.com/akhilnarang/scripts && cd scripts
./setup/android_build_env.sh
mkdir bin
mkdir android
mkdir /android/pe/
curl https://storage.googleapis.com/git-repo-downloads/repo > sudo /usr/local/bin/repo
chmod a+x /usr/local/bin/repo
cd /android/pe
repo init -u https://github.com/PixelExperience/manifest -b thirteen-plus
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
source build/envsetup.sh
lunch aosp_cheeseburger-userdebug
croot
mka bacon -j$(nproc --all)