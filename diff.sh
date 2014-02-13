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

(cd $a; npm install $module@$versionA > /dev/null) &
(cd $b; npm install $module@$versionB > /dev/null) &
wait

# diff

diff \
  --recursive \
  --unified \
  --exclude test \
  --exclude node_modules \
  --exclude Makefile \
  $a/node_modules/$module \
  $b/node_modules/$module \
  | egrep -v "\"readme\"|\"_id\"|\"_from\"|\"_resolved\""

# cleanup

rm -Rf $a $b

