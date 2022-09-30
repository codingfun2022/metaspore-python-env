#!/bin/bash

set -e
rm -rf $(realpath $(dirname ${BASH_SOURCE[0]}))/env
python -m venv $(realpath $(dirname ${BASH_SOURCE[0]}))/env
source $(realpath $(dirname ${BASH_SOURCE[0]}))/env/bin/activate
python -m pip freeze > $(realpath $(dirname ${BASH_SOURCE[0]}))/env/requirements.txt
cp -f $(realpath $(dirname ${BASH_SOURCE[0]}))/env/requirements.txt $(realpath $(dirname ${BASH_SOURCE[0]}))
