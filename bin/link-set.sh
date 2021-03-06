#!/bin/bash

# This script looks for
# sub-directories in notebooks and replicates
# these to any other notebooks directory
# as well as the work directory. This means that if
# you copy trhe notebooks to either
# notebooks/work or notebooks_xx or notebooks_xx/work
# you will have access to the same local directories
#
# P. Lewis p.lewis@ucl.ac.uk
# Thu  3 Sep 2020
#

# which dirs
opdirs=$(echo notebooks notebooks/work docs docs/work notebooks_lab notebooks_lab/work)

here=$(pwd)
echo "----> running $0 from $here"
echo "--> making links in ${opdirs[*]}"

base="$(cd $(dirname "$0") &&  cd .. &&  pwd -P && cd "$here")"
echo "--> location: $base"
repo=$(echo $base | awk -F/ '{print $NF}') 
echo "--> repo: $repo"

# HOME may not be set on windows
if [ -z "$HOME" ] ; then
  cd ~
  HOME=$(pwd)
  echo "--> HOME $HOME"
  cd "$here"
fi

# link to here from ~ for some scripts
cd $HOME
if [ ! "$HOME/$repo" == "$here" ]
then
  echo "--> linking $here $repo" 
  rm -f "$repo"
  ln -s $here "$repo"
fi
cd $here

# put links in all notebooks* directories
echo "--> linking ${subs[*]}"
subs=('bin' 'data' "$repo" 'images')
mkdir -p work ${subs[*]}

# outer loop 
for n in ${opdirs[@]}
do
  cd $base
  echo "--> sorting links in $n"
  mkdir -p "$n"
  cd ${base}/$n
  for link in ${subs[@]}
  do
    echo "--> $link"
    rm -f $link
    # dont link work
    if [ $link != "work" ]; then
      ln -s ../$link $link
    fi
  done
done
cd "${here}"

if [ -z "$UCLDATA" ] ; then
  echo "--> UCLDATA not set"
  export UCLDATA="../work"
  echo "--> UCLDATA -> $UCLDATA"
fi

cd data
if [ -L ucl ] ; then
  rm -f ucl
fi
echo "linking data/ucl to $UCLDATA"
ln -s $UCLDATA ucl
cd $here


csubs=('docs' 'bin' 'notebooks' 'notebooks_lab')
# outer loop
for n in ${csubs[@]}
do
  cd $base/$n
  if [ -L bin ] ; then
    rm -f bin
  fi
  echo "linking $n/bin to ../bin"
  ln -s ../bin bin
  if [ -L copy ] ; then
    rm -f copy
  fi
  echo "linking $n/copy to ../copy"
  ln -s ../copy copy
  cd $base
done

# dont want this!
rm -f bin/bin

echo "----> done running $0 from $here"
