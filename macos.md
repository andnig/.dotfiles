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
1. Run `ssh-add` to add ssh key to ssh-agent.
1. Run `gcloud init` to initialize gcloud.

## Syncthing
Open syncthing in your Pixel 6 and the web interface of the new computer on localhost:8384. 
On Pixel 6, add the new device - when asked for confirmation on the new device select "introducer"
("Verteilergeraet") - this automatically connects with all other devices Pixel 6 is synced.
Add the shared folders on Pixel 6 as normal.

## Troubleshooting

- If tmux does not install plugins, `rm -f $HOME/.config/tmux/plugins` and `ctrl + B + I` again.
