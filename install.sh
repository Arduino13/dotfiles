#!/bin/bash

#from https://github.com/jkrcma/dotfiles

#installing oh-my-zsh and vim plugin manager
cd ..
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd dotfiles

DST_DIR=$HOME
DIR="$( dirname "$0" )"

exec 5<"$DIR"/backup.txt
while read -u5 file; do
	original="$file"
	# skip empty lines and comments
	[ -z "$original" ] && continue
	[[ "$original" == \#* ]] && continue
	
	# normalize the filename (remove dot)
	[ "${file:0:1}" == "." ] && file="${file:1}"
	file="${file/.git\/config/\!gitconfig}"

	# ensure the target dir exists
	original_dir="$( dirname "$original" )"
	[ ! -d "$DST_DIR/$original_dir" ] && mkdir -p "$DST_DIR/$original_dir" 2>/dev/null

	# copy file
	cp -vi "$DIR/$file" "$DST_DIR/$original"

	# clone all external repositories
	if [ "$?" -eq 0 ] && [[ "$original" =~ ".git/config" ]]; then
		export GIT_DIR="$DST_DIR/$original_dir"
		export GIT_WORK_TREE="$GIT_DIR/.."
		git rev-parse --git-dir 2>/dev/null || git init && git pull
	fi
done

echo "You also need to isntall zsh, tmux, and run :PlugInstall inside VIM and maybe Prefix + I inside TMUX"

exec 5<&-
