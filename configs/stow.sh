#!/usr/bin/env zsh

if [[ -z $STOW_FOLDERS ]]; then
	case "$(uname -s)" in
	Darwin)
		STOW_FOLDERS="alacritty,karabiner,nvim,starship,tmux,taskopen,taskwarrior,vscode,zsh_macos"
	;;
	Linux)
		STOW_FOLDERS="nvim,starship,tmux,taskopen,taskwarrior,zsh_linux"
	;;
	esac
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

popd
