#!/bin/bash
# This script provides the bare minimum function definitions for compiling
# the wolfProvider library

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
LOG_FILE=${SCRIPT_DIR}/build-release.log
source ${SCRIPT_DIR}/utils-wolfprovider.sh

echo "Using openssl: $OPENSSL_TAG, wolfssl: $WOLFSSL_TAG"

init_wolfprov

set -x
$OPENSSL_INSTALL_DIR/bin/openssl speed -provider default sha256 rsa2048 ecdsap256
$OPENSSL_INSTALL_DIR/bin/openssl speed -provider $WOLFPROV_PATH/libwolfprov.so.0 sha256 rsa2048 ecdsap256

exit $?
