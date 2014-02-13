#!/usr/bin/env bash -e

# arguments

if [ "$#" -ne 3 ]; then
  echo "Usage: npm-diff <module> <versionA> <versionB>"
  exit
fi

module=$1
a=$2
b=$3

# work dir

work=/tmp/$RANDOM
mkdir $work
cd $work

# download

registry=`npm config get registry`

download(){
  mkdir $1
  cd $1
  curl --silent $registry$module/-/$module-$1.tgz | tar -xz
  folder=`ls`
  mv $folder/* ./
  rm -Rf $folder
}

download $a &
download $b &
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

rm -Rf $work

