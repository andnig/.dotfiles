# Macos system setup

To set up a new macos system, follow the steps below:

1. Log in to the App Store.
1. Download dotfiles: `git clone https://github.com/andnig/.dotfiles.git`
1. Run `bootstrap.sh` to bootstrap ansible. 
1. Run `ansible.sh --tag private (or work) --tag install`
1. Maybe run `conda init zsh` to initialize conda.
1. Run `tmux` and then press `prefix + I` to install plugins.
1. Replace http github url with ssh
    ```
    git remote remove origin
    git add remote origin git@github:andnig/.dotfiles.git
    ```
