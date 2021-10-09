#!/bin/bash

git clone https://git.openwrt.org/openwrt/openwrt.git

cd openwrt && git checkout origin/openwrt-21.02 -b 21.02
# ./script/feed.sh update -a 
# ./script/feed.sh install -a 

cp ../config_mt7621 .config
cp ../mt7621_hb_dev-01.dts target/linux/ramips/dts/
echo -e 'define Device/hb_dev-01
  $(Device/dsa-migration)
  DEVICE_VENDOR := HB
  DEVICE_MODEL := DEV-01
  IMAGE_SIZE := 16064k
  DEVICE_PACKAGES := kmod-mt7603 kmod-mt7615e \
  kmod-mt7663-firmware-ap kmod-mt7663-firmware-sta \
  kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += hb_dev-01' >> target/linux/ramips/image/mt7621.mk

make -j $(nproc)

cp -r bin/targets/ramips/mt7621/ ../