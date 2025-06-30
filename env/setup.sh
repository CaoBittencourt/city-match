#!/bin/sh

# script path
script=$(
    cd -- "$(
        dirname -- "${BASH_SOURCE[0]}"
    )" &>/dev/null && pwd
)

cd $script

# install conda if not installed
if ! command -v &>/dev/null; then
    bash ./miniconda.sh
fi

# environment spec
envFile="city.yaml"
envName=$(head -n 1 $envFile)
envName="${envName#*: }"

# create or update environment
if conda env list | grep -q "$envName"; then
    echo "Updating the "\""$envName"\"" environment."
    conda env update -n $envName -f $envFile
else
    echo "Creating the "\""$envName"\"" environment."
    conda env create -f $envFile
fi

# activate environment
source activate base
conda activate $envName

# root file
echo "$script/.." >.root

# environment variables
Rscript setup.r

rm .root
