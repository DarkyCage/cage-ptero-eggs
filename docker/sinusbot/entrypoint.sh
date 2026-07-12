#!/bin/bash
set -e

cd /home/container || exit 1

MODIFIED_STARTUP=$(eval echo "$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')")

echo ":/home/container$ ${MODIFIED_STARTUP}"

exec bash -c "${MODIFIED_STARTUP}"