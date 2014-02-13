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

# download

registry=`npm config get registry`

download(){
  cd $1
  curl --silent $registry$module/-/$module-$2.tgz | tar -xz
  folder=`ls`
  mv $folder/* ./
  rm -Rf $folder
}

download $a $versionA &
download $b $versionB &
wait

# diff

diff \
  --recursive \
  --unified \
  --exclude test \
  --exclude Makefile \
  $a $b \
  | egrep -v "\"readme\"|\"_id\"|\"_from\"|\"_resolved\""

# cleanup

rm -Rf $a $b

