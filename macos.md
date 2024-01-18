# Macos system setup

To set up a new macos system, follow the steps below:

1. Log in to the App Store.
1. Download dotfiles: `git clone https://github.com/andnig/.dotfiles.git`
1. Run `bootstrap.sh` to bootstrap ansible.
1. Run `ansible.sh --tag private (or work) --tag install`
1. Maybe run `conda init zsh` to initialize conda.
1. Run `conda config --set changeps1 False`
1. Run `tmux` and then press `prefix + I` to install plugins.
1. Replace http github url with ssh

   ```bash
   git remote remove origin
   git add remote origin git@github:andnig/.dotfiles.git
   ```

1. Run `ssh-add` to add ssh key to ssh-agent.
1. Run `gcloud init` to initialize gcloud.

## Syncthing

Open syncthing in your Pixel 6 and the web interface of the new computer on
localhost:8384.
On Pixel 6, add the new device - when asked for confirmation on the new device
select "introducer" ("Verteilergeraet") - this automatically connects with all
other devices Pixel 6 is synced.
Add the shared folders on Pixel 6 as normal.

## Yabai

Add this to file `/private/etc/sudoers.d/yabai`:
(make sure to change the hash each time you update yabai)

```bash
# input the line below into the file you are editing.
#  replace <yabai> with the path to the yabai binary (output of: which yabai).
#  replace <user> with your username (output of: whoami).
#  replace <hash> with the sha256 hash of the yabai binary (output of: shasum -a 256 $(which yabai)).
#   this hash must be updated manually after running brew upgrade.

andre ALL=(root) NOPASSWD: sha256:5c729cfc728ec8780c14d6fe0bfd74376bd2f057960b542c41106d8e8c5df787 /opt/homebrew/bin/yabai --load-sa
```

Run `./postfix_macos.sh` to set install and set up skhd, yabai and sketchybar.

## Troubleshooting

- If tmux does not install plugins, `rm -f $HOME/.config/tmux/plugins` and
  `ctrl + B + I` again.
