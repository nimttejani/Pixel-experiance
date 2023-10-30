#!/bin/bash

sudo apt install make build-essential libncurses-dev bison flex libssl-dev libelf-dev cmake clang cpp gcc libncurses5 android-sdk-platform-tools git python3 python3-pip -y
sleep 2
git clone https://github.com/akhilnarang/scripts && cd scripts
sleep 2
bash /setup/android_build_env.sh
sleep 2
mkdir android/
mkdir android/pe/
sleep 2 
curl https://storage.googleapis.com/git-repo-downloads/repo > sudo /usr/bin/repo
sudo chmod a+x /usr/bin/repo
cd /android/pe
repo init -u https://github.com/PixelExperience/manifest -b thirteen-plus
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
source build/envsetup.sh
lunch aosp_cheeseburger-userdebug
croot
mka bacon -j$(nproc --all)
