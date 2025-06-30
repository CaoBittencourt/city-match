#!/bin/bash

# make miniconda directory
mkdir -p ~/miniconda3

# get miniconda installer
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh

# run miniconda installer
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3

# remove miniconda installer
rm ~/miniconda3/miniconda.sh

# initialize miniconda
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh