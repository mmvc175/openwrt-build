#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.1.6/g' package/base-files/files/bin/config_generate
cp -f feeds/smpackage/.github/diy/default-settings package/emortal/default-settings/files/99-default-settings
rm -rf feeds/packages/net/{alist,adguardhome,brook,gost,mosdns,redsocks*,smartdns,trojan*,v2ray*,xray*}
rm -rf feeds/smpackage/luci-theme-design && git clone -b js --single-branch https://github.com/gngpp/luci-theme-design feeds/smpackage/luci-theme-design
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
cp -f feeds/smpackage/.github/diy/banner package/base-files/files/etc/banner
sed -i "s/%D %V, %C/openwrt $(date +'%m.%d') by mmvc175/g" package/base-files/files/etc/banner
sed -i 's/CONFIG_PACKAGE_luci-app-adguardhome=y/# CONFIG_PACKAGE_luci-app-adguardhome is not set/g' .config
sed -i 's/# CONFIG_PACKAGE_luci-app-ddns is not set/CONFIG_PACKAGE_luci-app-ddns=y/g' .config
sed -i 's/CONFIG_PACKAGE_luci-app-mosdns=y/# CONFIG_PACKAGE_luci-app-mosdns is not set/g' .config
sed -i 's/CONFIG_PACKAGE_luci-app-openclash=y/# CONFIG_PACKAGE_luci-app-openclash is not set/g' .config
sed -i 's/CONFIG_PACKAGE_luci-app-ssr-plus=y/# CONFIG_PACKAGE_luci-app-ssr-plus is not set/g' .config
sed -i 's/# CONFIG_PACKAGE_luci-app-ttyd is not set/CONFIG_PACKAGE_luci-app-ttyd=y/g' .config
sed -i 's/# CONFIG_PACKAGE_luci-app-vlmcsd/CONFIG_PACKAGE_luci-app-vlmcsd=y/g' .config
sed -i 's/# CONFIG_PACKAGE_luci-app-wolplus is not set/CONFIG_PACKAGE_luci-app-wolplus=y/g' .config
#sed -i 's/# CONFIG_PACKAGE_luci-app-wechatpush is not set/CONFIG_PACKAGE_luci-app-wechatpush=y/g' .config
