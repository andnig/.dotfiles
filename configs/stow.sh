#!/usr/bin/env zsh

if [[ -z $STOW_FOLDERS ]]; then
	case "$(uname -s)" in
	Darwin)
		STOW_FOLDERS="kitty,karabiner,nvim,starship,tmux,taskopen_macos,taskwarrior,vscode,zsh_macos,ssh,scripts,yabai,skhd,sketchybar"
	;;
	Linux)
        rm -rf "$HOME/.zshrc"
		STOW_FOLDERS="kitty,nvim,starship,tmux,taskopen_linux,taskwarrior,zsh_linux,ssh,scripts"
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
