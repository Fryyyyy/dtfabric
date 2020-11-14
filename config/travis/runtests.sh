#!/bin/bash
#
# Script to run tests on Travis-CI.
#
# This file is generated by l2tdevtools update-dependencies.py, any dependency
# related changes should be made in dependencies.ini.

# Exit on error.
set -e;

if test -n "${FEDORA_VERSION}";
then
	CONTAINER_NAME="fedora${FEDORA_VERSION}";
	CONTAINER_OPTIONS="-e LANG=C.utf8";

	if test -n "${TOXENV}";
	then
		TEST_COMMAND="tox -e ${TOXENV}";
	else
		TEST_COMMAND="./config/travis/run_python3.sh";
	fi
	# Note that exec options need to be defined before the container name.
	docker exec ${CONTAINER_OPTIONS} ${CONTAINER_NAME} sh -c "cd dtfabric && ${TEST_COMMAND}";

elif test -n "${UBUNTU_VERSION}";
then
	CONTAINER_NAME="ubuntu${UBUNTU_VERSION}";
	CONTAINER_OPTIONS="-e LANG=en_US.UTF-8";

	if test -n "${TOXENV}";
	then
		# Also see: https://docs.codecov.io/docs/testing-with-docker
		curl -o codecov_env.sh -s https://codecov.io/env;

		# Generates a series of -e options.
		CODECOV_ENV=$(/bin/bash ./codecov_env.sh);

		CONTAINER_OPTIONS="${CODECOV_ENV} ${CONTAINER_OPTIONS}";

		TEST_COMMAND="tox -e ${TOXENV}";

	elif test "${TARGET}" = "jenkins3";
	then
		TEST_COMMAND="./config/jenkins/linux/run_end_to_end_tests_py3.sh travis";
	else
		TEST_COMMAND="./config/travis/run_python3.sh";
	fi
	# Note that exec options need to be defined before the container name.
	docker exec ${CONTAINER_OPTIONS} ${CONTAINER_NAME} sh -c "cd dtfabric && ${TEST_COMMAND}";

elif test "${TARGET}" = "dockerfile";
then
	cd config/docker && docker build --build-arg PPA_TRACK="dev" -f Dockerfile .

elif test "${TRAVIS_OS_NAME}" = "osx";
then
	# Set the following environment variables to build pycrypto and yara-python.
	export CFLAGS="-I/usr/local/include -I/usr/local/opt/openssl@1.1/include ${CFLAGS}";
	export LDFLAGS="-L/usr/local/lib -L/usr/local/opt/openssl@1.1/lib ${LDFLAGS}";
	export TOX_TESTENV_PASSENV="CFLAGS LDFLAGS";

	# Set the following environment variables to ensure tox can find Python 3.8.
	export PATH="/usr/local/opt/python@3.8/bin:${PATH}";

	tox -e ${TOXENV};
fi
