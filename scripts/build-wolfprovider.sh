#!/bin/bash
# This script provides the bare minimum function definitions for compiling
# the wolfProvider library

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
LOG_FILE=${SCRIPT_DIR}/build-release.log
source ${SCRIPT_DIR}/utils-wolfprovider.sh

echo "Using openssl: $OPENSSL_TAG, wolfssl: $WOLFSSL_TAG"

init_wolfprov

$OPENSSL_INSTALL_DIR/bin/openssl speed -provider default sha256 rsa2048 ecdsap256
$OPENSSL_INSTALL_DIR/bin/openssl speed -provider libwolfprov.so.0 -provider-path $WOLFPROV_PATH sha256 rsa2048 ecdsap256

exit $?
