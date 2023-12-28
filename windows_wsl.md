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
11. Run `tmux` and then press `prefix + I` to install plugins.
12. Replace http github url with ssh
    ```
    git remote remove origin
    git add remote origin git@github.com:andnig/.dotfiles.git
    ```
