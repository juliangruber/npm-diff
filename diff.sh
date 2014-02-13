#!/usr/bin/env bash -e

# arguments

if [ "$#" -ne 3 ]; then
  echo "Usage: npm-diff <module> <versionA> <versionB>"
  exit
fi

module=$1
versionA=$2
versionB=$3

# work dirs

a=/tmp/$RANDOM
b=/tmp/$RANDOM
mkdir $a $b

# checkout

registry=`npm config get registry`
(cd $a && curl --silent $registry$module/-/$module-$versionA.tgz | tar -zx) &
(cd $b && curl --silent $registry$module/-/$module-$versionB.tgz | tar -zx) &
wait

# diff

diff \
  --recursive \
  --unified \
  --exclude test \
  --exclude Makefile \
  $a/package \
  $b/package \
  | egrep -v "\"readme\"|\"_id\"|\"_from\"|\"_resolved\""

# cleanup

rm -Rf $a $b

