#!/bin/bash
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# File name: customize.sh
# Description: OpenWrt DIY script part 2 (After Update config)

# 固件硬改设置 
#-------------------------------------------#         # -------------------------------#
# reg = <0x50000 0x7b0000>;  // 8MB  FLASH  #         #  IMAGE_SIZE := 7872k   // 8M   #
# reg = <0x50000 0xfb0000>;  // 16MB FLASH  #         #  IMAGE_SIZE := 16064k  // 16M  #
# reg = <0x50000 0x1fb0000>; // 32MB FLASH  #         #  IMAGE_SIZE := 32448k  // 32M  #
#-------------------------------------------#         #--------------------------------#

# K2硬改配置
#sed -i 's/<0x50000 0x7b0000>/<0x50000 0x1fb0000>/g' target/linux/ramips/dts/mt7620a_phicomm_psg1218.dtsi
#sed -i '/phicomm_psg1218a/{n;n;s/7872k/32448k/;}' target/linux/ramips/image/mt7620.mk

# 删除默认argon主题
rm -rf package/lean/luci-theme-argon

# 下载其它插件
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# 修改默认LAN地址
sed -i 's/192.168.1.1/192.168.8.8/g' package/base-files/files/bin/config_generate

# 修改固件信息
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='Set-saiL '/g" package/lean/default-settings/files/zzz-default-settings
sed -i "s/DISTRIB_REVISION='R20.8.27'/DISTRIB_REVISION='TEL:15095660155'/g" package/lean/default-settings/files/zzz-default-settings

# 修改SSH登录信息
sed -i 's/W I R E L E S S   F R E E D O M/ SET-SAIL     TEL:15095660155/g' package/base-files/files/etc/banner

# 删除默认密码
sed -i '/root::0:0/d' package/lean/default-settings/files/zzz-default-settings
