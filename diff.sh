#!/usr/bin/env bash -e

# arguments

if [ "$#" -ne 3 ]; then
  echo "Usage: npm-diff <module> <versionA> <versionB>"
  exit
fi

module=$1
versionA=$2
versionB=$3

# colored diff with fallback

cdiff() {
  if hash colordiff 2>/dev/null; then
    colordiff "$@"
  else
    diff "$@"
  fi
}

# work dirs

a=/tmp/$RANDOM
b=/tmp/$RANDOM
mkdir $a $b

# checkout

(cd $a; npm install $module@$versionA) &
(cd $b; npm install $module@$versionB) &
wait

# diff

cdiff -u $a/node_modules/$module $b/node_modules/$module | egrep -v "\"readme\"|\"_id\"|\"_from\"|\"_resolved\""

# cleanup

rm -Rf $a $b

