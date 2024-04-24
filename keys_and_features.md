# Keys and features

## Features

- _GNU stow_ is used for dotfile management. Dotfiles are stored in ~/.dotfiles,
  and stow then symlinks to home. To add a new symlink folder, add a folder to
  ~/.dotfiles/configs and run `stow <new folder> -t $HOME`
- _Neovim_ is the main editor. It uses lazyvim as distro. The main features are
  LSP, telescope, and treesitter. The configuration is modular and can be found
  in ~/.dotfiles/configs/nvim
- _ZSH_ is used as shell, with oh-my-zsh as plugin manager.
- _Starship_ is used as shell prompt, showing various nice status information
- _TMUX_ is used as terminal multiplexer and automatically started
- The folder _scripts_ contains useful scripts for various tasks
- _fzf_ is used for fuzzy finding in the terminal
- _taskwarrior_ is used for task management. **taskserver** (running on
  hetzner.general) is used to sync the tasks
- On Winodws: _glazewm_ is used as window manager
- On MacOS: **yabai** is used as window manager, with **skhd** as hotkey daemon
- On Windows: a powershell script bootstraps **Ubuntu** in WSL2
- **SSH keys** are automatically managed with ansible vault
- **syncthing** is used to sync the following folders between devices:
  (Note: navigate to `http://localhost:8384` to access the syncthing web
  interface. You need to initially add these folders manually to the interface
  and accept them in all the other devices to sync them.
  (You can run `syncthing cli show system | rg guiAddressUsed` to get the address))
  - **~/.sync**
  - **~/.notes**
- **ripgrep** is used for searching in files
- **zioxide** is used as smart replacement for `cd`
- **bat** is used to get nicer output for `cat`
- Instead of `ls`, **exa** is used, to get better output
- **jq** can be used to parse json outputs
- **httpie** is used as a curl replacement
  (eg. http https://google.com hand=12 peter=1 sends POST JSON)
- Instead of **apt**, use **nala** to install packages

## General

- Open tmux windowizer from shell: `Ctrl + f` (or `Ctrl + w`)
- Open tmux sessionizer from shell: `Ctrl + s`
- Open tmux sessionizer from nvim: `Ctrl + b S`
- Open tmux windowizer from nvim: `Ctrl + b W`
- Find and open note: `fo <search term> <optional: program to open it with>`
- Create new note: `nn <note type (idea, general, russmedia)> <filename>`
- Open notes: `on`
- Add a new anaconda env: `add_conda.sh <env name>`
- Create a new reveal.js presentation server: `new_presentation.sh <presentation name>`
- Transform markdown to reveal.js presentation: `convert_md_to_reveal.sh <markdown file> <output file> <theme>`

## Tmux

- Prefix: `Ctrl + b`
- Split pane horizontally: `Ctrl + b %`
- Split pane vertically: `Ctrl + b "`
- Move to next pane: `Ctrl + b h/j/k/l` (vim keys)
- Install plugins: `Ctrl + b I`
- Enter copy mode: `Ctrl + b [`
- Yank in copy mode: `y`
- Paste from clipboard: `Ctrl + b p` (works in everything running in tmux)
- Open tmux command fzf reference: `Ctrl + b F`
- Open file in tmux: `Ctrl + b f`
- Open url in tmux: `Ctrl + b u`
- Save tmux session: `Ctrl + b Ctrl + s`
- Restore tmux session: `Ctrl + b Ctrl + r`
- Open cheat sheet in tmux: `Ctrl + b h`
- Open tldr in tmux: `Ctrl + b t`
- Open tmux command line: `Ctrl + b :`
- Kill pane: `Ctrl + b x`
- Kill window: `Ctrl + b &`
- Kill session: `Ctrl + b :kill-session`
- attach to existing session: `tmux attach -t <session_name>` (or just `tmux a`)
- detach from session: `Ctrl + b d`
- list sessions: `tmux ls`
- kill session: `tmux kill-session -t <session_name>`
- rename session: `tmux rename-session -t <old_name> <new_name>`
- manage session: `Ctrl + b s`
- next/previous window: `Ctrl + b n/p`
- specific window: `Ctrl + b <window_number>`

## Neovim

- leader: `Space`
- localleader: `\`
- open file `:e <file>`
- save file `:w`
- close file `:q`
- close file without saving `:q!`
- save and close file `:wq`
- open lua command prompt `:lua`
- open telescope file search: `leader leader`
- open telescope fuzzy live grep: `leader /`
- open telescope buffers: `leader fb` (file buffers)
- open issues: `leader xx`
- add telescope to quick fix list: `Ctrl q`
- open quick fix list: `leader xq`
- next/previous quick fix: `[q / ]q`
- next/previous error: `[e / ]e`
- next/previous buffer: `Ctrl h/l`
- open lazygit: `leader gg`
- Surround word: `gsaiw` followed by the surrounding character
- Jump between brackets: `%`
- Jump to definition: `gd`
- Jump to references: `gr`
- Add word to spell list: `zg`
- Mark word as wrong: `zw`
- Get suggestions for word: `z=`
- Record macros: `q<register>` (Play them with `@<register>`)

- open chatgpt ui: `leader ac`
- in chatgpt: help: `Ctrl h`

- open dbt commands: `localleader d`
- open Molten (jupyter kernel) commands: `localleader c`
