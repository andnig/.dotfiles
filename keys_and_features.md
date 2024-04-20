# Keys and features

## General

- Open tmux sessionizer: `Ctrl + f`
- Find and open note: `fo <search term> <optional: program to open it with>`
- Create new note: `nn <note type (idea, general, russmedia)> <filename>`
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

- open chatgpt ui: `leader ac`
- in chatgpt: help: `Ctrl h`

- open dbt commands: `localleader d`
- open Molten (jupyter kernel) commands: `localleader c`
