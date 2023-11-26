#! /usr/bin/env bash

set -e

display_help() {
	echo "Usage: $0 [options...]" >&2
	echo
	echo "   --tag  TAG        Specify a tag. Can be used multiple times."
	echo "   --help            Display this help message."
	echo
	exit 1
}

declare -a tags_array

while [[ "$#" -gt 0 ]]; do
	case $1 in
	--tag)
		tags_array+=("$2")
		shift
		;;
	*)
		echo "Unknown parameter passed: $1"
		exit 1
		;;
	esac
	shift
done

if [[ "${#tags_array[@]}" -eq 0 ]]; then
	echo "No tags specified." >&2
	display_help
fi

# Check if the tag "work" is in the tags array
if [[ " ${tags_array[@]} " =~ " work " ]]; then
	tags_array+=("git-work")
else
	tags_array+=("git-personal")
fi

# Join the tags into a comma-separated string
tags_string=$(
	IFS=,
	echo "${tags_array[*]}"
)

# Run main playbook
echo "[i] Run Playbook"
ansible-playbook ./ansible/local.yml --ask-become-pass --tags $tags_string

echo "[i] From now on you can use $ dotfiles to manage your dotfiles"
echo "[i] You can run the script postinstall.sh now!"
