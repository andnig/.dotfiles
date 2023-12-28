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

## Troubleshooting

- If tmux does not install plugins, `rm -f $HOME/.config/tmux/plugins` and `ctrl + B + I` again.
