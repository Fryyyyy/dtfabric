#!/bin/bash
#
# Script to set up Travis-CI test VM.

COVERALL_DEPENDENCIES="python-coverage python-coveralls python-docopt";

PYTHON2_DEPENDENCIES="";

PYTHON3_DEPENDENCIES="";

# Exit on error.
set -e;

if test `uname -s` = "Darwin";
then
	# git clone https://github.com/log2timeline/l2tdevtools.git;
	git clone -b tox https://github.com/joachimmetz/l2tdevtools.git

	mv l2tdevtools ../;
	mkdir dependencies;

	PYTHONPATH=../l2tdevtools ../l2tdevtools/tools/update.py --download-directory=dependencies --preset=dtfabric;

elif test `uname -s` = "Linux";
then
	sudo add-apt-repository ppa:gift/dev -y;
	sudo apt-get update -q;
	sudo apt-get install -y ${COVERALL_DEPENDENCIES} ${PYTHON2_DEPENDENCIES} ${PYTHON3_DEPENDENCIES};
fi
