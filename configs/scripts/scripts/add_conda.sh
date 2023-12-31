mamba env create --name $1 --file ~/.dotfiles/configs/conda/environment.yml
ipython kernel install --user --name=$1
