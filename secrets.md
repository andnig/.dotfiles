# Secrets

Secrets are managed using 1Password. Either use the 1Password desktop app
or for terminal operations, use the `op` CLI tool.

Follow the steps in the [1Password chapter in secrets.md](./arch.md) for
initial setup.

### Using the 1Password SSH Agent

If you've added your SSH keys to 1Password and activated the SSH agent in
the 1Password app, simply run any SSH command (or `git`) and you're asked
to authorize the SSH key usage via a 1Password prompt. No messing around
with local SSH keys.

### Using the 1Password CLI for environment variables or secrets

You can use the `op` CLI tool to fetch secrets stored in 1Password. For example, to
fetch an OpenAI API key stored in 1Password, you can add the following line to
your `~/.zshrc` or `~/.bashrc`:

```bash
export OPENAI_API_KEY=$(op read 'op://<vault-name>/<field-name>/password')
```

Instead of loading the secret from a local file, it is fetched directly from
1Password whenever a new shell session is started.

## Legacy: SSH Agent and environment variables

If you don't want to use 1Password, you can set up an SSH agent and
export the necessary environment variables manually. By default, this is
disabled, but can be executed as follows:

1. in `./configs/zsh_arch/.zshrc`, comment the current `export SSH_AUTH_SOCK=~/.1password/agent.sock`
   line and uncomment the lines below, for the local SSH-agent.

2. Add your SSH key (both public and private) to ~/.ssh/, e.g. `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`.

3. Source your `.zshrc` or restart your terminal.

> **Note:** If you want a more automated solution:
> a. add your SSH keys to this repository in folder `.ssh/`
> b. use ansible-vault to encrypt the files: `ansible-vault encrypt .ssh/id_rsa`
> make sure to save the password used for encryption in a safe place.
> c. Run the following script.
> You can check in the encrypted ssh keys to your github repository.

```bash
#!/bin/bash

source_key="~/.dotfiles/.ssh/id_rsa"
dest_key="~/.ssh/id_rsa"

# Check if private SSH key exists
if [ -f "$dest_key" ]; then
    private_key_exists=true
else
    private_key_exists=false
fi

# Check if public SSH key exists
if [ -f "${dest_key}.pub" ]; then
    public_key_exists=true
else
    public_key_exists=false
fi

# Ensure .ssh directory exists
dest_dir=$(dirname "$dest_key")
mkdir -p "$dest_dir"
chmod 700 "$dest_dir"

# Install ssh key (private)
if [ "$private_key_exists" = false ]; then
    ansible-vault decrypt --ask-vault-pass --output="$dest_key" "$source_key"
    chmod 600 "$dest_key"
fi

# Install ssh key (public)
if [ "$public_key_exists" = false ]; then
    ansible-vault decrypt --ask-vault-pass --output="${dest_key}.pub" "${dest_key}.pub.vault"
    chmod 644 "${dest_key}.pub"
fi
```

### Environment variables

For other secrets, you can add them to the `.secrets` folder in this repository.
Again, use `ansible-vault` to encrypt the files.

For example, create a file `openai.secret` to store your OpenAI API key. After
encrypting it, use this script to copy it to your home directory:

```bash
#!/bin/bash
source_file="~/.dotfiles/.secrets/openai.secret"
dest_file="~/.secrets/openai.secret"
if [ ! -f "$dest_file" ]; then
    mkdir -p "$(dirname "$dest_file")"
    ansible-vault decrypt --ask-vault-pass --output="$dest_file" "$source_file"
    chmod 600 "$dest_file"
fi
```

In the `.zshrc` file change all the occurrences of `op read` to read from the
local secret files, e.g.

```bash
export OPENAI_API_KEY=$(cat ~/.secrets/openai.secret)
```
