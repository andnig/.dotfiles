#! /usr/bin/env bash

set -e

case "$(uname -s)" in
Darwin)
	# install Command Line Tools
	if [[ ! -x /usr/bin/gcc ]]; then
		echo "[i] Install macOS Command Line Tools"
		xcode-select --install
	fi

	# install homwbrew
	if [[ ! -x /opt/homebrew/bin/brew ]]; then
		echo "[i] Install Homebrew"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	# install ansible
	if [[ ! -x /opt/homebrew/bin/ansible ]]; then
		echo "[i] Install Ansible"
		brew install ansible
	fi

	;;

Linux)
	if [ -f /etc/os-release ]; then
		. /etc/os-release

		case "$ID" in
		debian | ubuntu)
			if [[ ! -x /usr/bin/ansible ]]; then
				echo "[i] Install Ansible"
				sudo apt-get install -y ansible
			fi
			;;

		*)
			echo "[!] Unsupported Linux Distribution: $ID"
			exit 1
			;;
		esac
	else
		echo "[!] Unsupported Linux Distribution"
		exit 1
	fi
	;;

*)
	echo "[!] Unsupported OS"
	exit 1
	;;
esac
