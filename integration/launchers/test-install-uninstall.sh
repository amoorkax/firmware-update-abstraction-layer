#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. "$DIR"/../integration-messages.sh

set -euxo pipefail

suite_started SETUP
"$DIR"/vagrant-up.sh

cleanup() {
    suite_finished SETUP
}
trap cleanup 0

test_with_command "INSTALL_FRAMEWORK" \
    vagrant ssh -c \"sudo /test/general/INSTALL_FAL.sh\"
