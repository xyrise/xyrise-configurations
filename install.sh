#!/bin/sh

_dp="0544"
_fp="0444"
_sp="0744"

dest_dir="${1:-${HOME}}"

[ ! -d "$dest_dir" ] && { echo "Error: Directory $dest_dir not found."; exit ; }


rm -rf $dest_dir/.config/nvim
ln -s $(pwd)/.config/nvim $dest_dir/.config/
