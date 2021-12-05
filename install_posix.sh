#!/bin/sh

_dp="0544"
_fp="0444"
_sp="0744"

dest_dir="${1:-${HOME}}"

[ ! -d "$dest_dir" ] && { echo "Error: Directory $dest_dir not found."; exit ; }


mv $dest_dir/.config/nvim $dest_dir/.config/nvim_bak
mv $dest_dir/.zshrc $dest_dir/.zshrc_bak
ln -s $(pwd)/config/nvim $dest_dir/.config/
ln -s $(pwd)/.zshrc $dest_dir/
