#!/usr/bin/env zsh

if [[ -z $STOW_FOLDERS ]]; then
	STOW_FOLDERS="alacritty,karabiner,nvim,starship,tmux"
fi

if [[ -z $DOTFILES ]]; then
	DOTFILES=$HOME/.dotfiles/configs
fi

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g"); do
	echo "stow $folder"
	stow -D $folder -t $HOME
	stow $folder -t $HOME
done

# if macos, stow zsh_macos, otherwise zsh_linux
if [[ $(uname) == "Darwin" ]]; then
    stow zsh_macos -t $HOME
else
    stow zsh_linux -t $HOME
fi

popd
