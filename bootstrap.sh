#!/usr/bin/env bash
set -e

echo "[i] Ask for sudo password"
sudo -v

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
				sudo apt-get update
				sudo apt-get install -y ansible
			fi

	                # install homwbrew
			if [[ ! -x /opt/homebrew/bin/brew ]]; then
				echo "[i] Install Homebrew"
				/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

echo "[i] Installing Ansible Galaxy"
ansible-galaxy install -r ansible/requirements.yml

echo "[i] Bootstrapping done. Please run the ansible.sh script with tags 'install' and either 'personal' or 'work'"
echo "[i] For example: ansible.sh --tag install --tag personal"
