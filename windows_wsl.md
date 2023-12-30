# Windows

1. Run powershell as administrator.
2. Download dotfiles: `git clone https://github.com/andnig/.dotfiles.git`
3. Run the following command:
```powershell
Set-ExecutionPolicy Bypass -Scope Process
```
4. Optional: If your WSL distro is NOT "Ubuntu" change "Ubuntu" to your distro name in the following
    files:
    - `windows_terminal/settings.json`
5. Run the following command:
```powershell
./prepare_win.ps1 -distro 'Ubuntu' -wsluser 'andreas'
```
6. Run WSL and set 'andreas' as your user.
7. Download dotfiles in WSL: `git clone https://github.com/andnig/.dotfiles.git`
8. Run `bootstrap.sh` in WSL
9. Run `ansible.sh --tag private (or work) --tag install`
10. Maybe run `conda init zsh` to initialize conda.
11. Maybe run `source ~/conda/etc/profile.d/mamba.sh` and `source ~/conda/etc/profile.d/conda.sh`
12. Run `tmux` and then press `prefix + I` to install plugins.
13. Replace http github url with ssh
    ```
    git remote remove origin
    git add remote origin git@github.com:andnig/.dotfiles.git
    ```
14. Run `ssh-add` to add ssh key to ssh-agent.

## VSCode
For now, vscode is is not automatically configured as it's kinda shitshow with WSL.
Run `./ansible.sh --tag vscode` to install the extensions (not sure if this works due to windows).
Then manually configure the settings, or copy the settings.json from 
`configs/vscode_wsl/settings.json` to the vscode settings folder 
(`%APPDATA%\Code\User\settings.json`)

## Syncthing
Open syncthing in your Pixel 6 and the web interface of the new computer on localhost:8384. 
On Pixel 6, add the new device - when asked for confirmation on the new device select "introducer"
("Verteilergeraet") - this automatically connects with all other devices Pixel 6 is synced.
Add the shared folders on Pixel 6 as normal.
(If the web ui cant be reached, look at `systemclt status syncthing@andreas` for info on which
port the ui runs).

## Troubleshooting

- If tmux does not install plugins, `rm -f $HOME/.config/tmux/plugins` and `ctrl + B + I` again.
- You should see this image below. Otherwise, please check `image.nvim`
![image](./remote.png)

