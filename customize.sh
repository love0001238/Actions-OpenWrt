#!/bin/bash
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# File name: customize.sh
# Description: OpenWrt DIY script part 2 (After Update config)

# 下载其它插件
git clone https://github.com/jerrykuku/lua-maxminddb.git package
git clone https://github.com/jerrykuku/luci-app-vssr.git package
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package

# 修改默认LAN地址
sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 修改固件信息

# 修改SSH登录信息

# 删除默认密码
