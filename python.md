# Python development

1. In neovim, press "Leader c v" to open virtual environment selection.

   The virtuel environments are loaded from the conda environments folder
   Check the `CONDA_BASE_PREFIX` variable in `~/.zshrc`, if there is an issue.

2. Additionally, there is molten-nvim installed, a plugin to interact with
   the jupyter kernel and interactivly send commands to the kernel.
   For that to work, each conda environment needs ipykernel installed and
   each environment needs to be registered with jupyter.
   So, to add a new environment, run the script `add_conda.sh` which
   automatically installs the required packages and registers the environment
   with jupyter.
   (If registering does not work, run
   `python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()' kernel install --user --name=<env_name>`
   manually.)

3. To interact with a jupyter file, you might want to use `jupytext` which
   converts jupyter notebooks to python files and vice versa. Jupytext is
   automatically installed if you add a new conda environment with
   `add_conda.sh`.

4. To convert a jupyter notebook to a jupytext synced python file, run
   `jupytext --set-formats ipynb,py:percent notebook.ipynb`.

5. Open this newly created python file and run:
   - :MoltenInit (Note: In the file buffer, not neotree!)
   - :MoltenEvaluate
