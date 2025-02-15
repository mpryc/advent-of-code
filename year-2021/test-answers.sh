#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

WORK_DIR=${1:-.}

EXPECTED_ANSWERS=(
    1342
    1378
)


#
# Have expected answers as command line arguments
#
set -- "${EXPECTED_ANSWERS[@]}"


#
# Test the solutions
#
for DIRECTORY in "${WORK_DIR}/day-"*; do
    pushd "${DIRECTORY}" > /dev/null

    if [ -f 'part-1.py' ]; then
        EXPECTED_ANSWER=$1
        ACTUAL_ANSWER=$(python3 part-1.py)
        if [ "${ACTUAL_ANSWER}" != "${EXPECTED_ANSWER}" ]; then
            exit 1
        fi
        shift
    fi

    if [ -f 'part-2.py' ]; then
        EXPECTED_ANSWER=$1
        ACTUAL_ANSWER=$(python3 part-2.py)
        if [ "${ACTUAL_ANSWER}" != "${EXPECTED_ANSWER}" ]; then
            exit 1
        fi
        shift
    fi

    popd > /dev/null
done
