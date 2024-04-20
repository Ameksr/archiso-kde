#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="archlinux-baseline"
iso_label="ARCH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Arch Linux <https://archlinux.org>"
iso_application="Arch Linux baseline"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')

arch="x86_64"
pacman_conf="airootfs/etc/pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=(zstd -c -T0 --long -19)
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:400"
  ["/etc/sudoers.d"]="0:0:750"
  ["/etc/sudoers.d/g_wheel"]="0:0:440"
)
