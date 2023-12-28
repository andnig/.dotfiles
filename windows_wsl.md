# Windows

1. Run powershell as administrator.
2. Run the following command:
```powershell
Set-ExecutionPolicy Bypass -Scope Process
```
3. Optional: If your WSL distro is NOT "Ubuntu" change "Ubuntu" to your distro name in the following
    files:
    - `windows_terminal/settings.json`
4. Run the following command:
```powershell
./prepare_win.ps1 -distro 'Ubuntu' -wsluser 'andreas'
```
5. Run WSL and set 'andreas' as your user.
6. Run `bootstrap.sh` in WSL
7. Run `ansible.sh --tag private (or work) --tag install`
8. Maybe run `conda init zsh` to initialize conda.
9. Run `tmux` and then press `prefix + I` to install plugins.

