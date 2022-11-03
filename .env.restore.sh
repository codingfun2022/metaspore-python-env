#!/bin/bash

if [ -f $(realpath $(dirname ${BASH_SOURCE[0]}))/.env/requirements.txt ]
then
    exit
fi

set -e
rm -rf $(realpath $(dirname ${BASH_SOURCE[0]}))/.env
python -m venv $(realpath $(dirname ${BASH_SOURCE[0]}))/.env
source $(realpath $(dirname ${BASH_SOURCE[0]}))/.env/bin/activate
python -m pip install --upgrade pip
python -m pip install torch==1.11.0+cpu -f https://download.pytorch.org/whl/cpu/torch_stable.html
python -m pip install https://ks3-cn-beijing.ksyuncs.com/dmetasoul-bucket/releases/spark/pyspark-3.1.2.265f9ad4ee-py2.py3-none-any.whl
python -m pip install metaspore~=1.1.0
python -m pip freeze > $(realpath $(dirname ${BASH_SOURCE[0]}))/.env/requirements.txt
cp -f $(realpath $(dirname ${BASH_SOURCE[0]}))/.env/requirements.txt $(realpath $(dirname ${BASH_SOURCE[0]}))
