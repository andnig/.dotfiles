mamba env create --name $1 --file ~/.dotfiles/configs/conda/environment.yml
mamba activate $1
python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()' kernel install --user --name=$1
