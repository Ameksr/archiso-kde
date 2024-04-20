script_path=$(readlink -f "${0%/*}")
work_dir="work"

arch_chroot() {
    arch-chroot "${script_path}/${work_dir}/x86_64/airootfs" /bin/bash -c "${1}"
}

do_merge() {

arch_chroot "$(cat <<EOF 

# Init & populate keys
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Syy

EOF
)"

}

do_merge
