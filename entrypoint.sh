#! /bin/sh
# jbc labs generic entrypoint.sh

echo "Printing build log"
cat /tmp/build.log

exec "$@"
