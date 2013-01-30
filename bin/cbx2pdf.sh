#!/bin/bash -x

#set -e # Exit if error
set -u # Exit if a variable was not set

here=`pwd`

cbr=${here}/$1

tmp=`mktemp -d`
mkdir -p "${tmp}"

cd "${tmp}"

unp "${cbr}"

rm "$(basename $cbr)"

if [ "`find . ! -name . -prune -type f`" ]
then
        convert `find . ! -name . -prune -type f` "${cbr}.pdf" # XXX FIXME Error with filenames with spaces!!!
fi

find -maxdepth 1 -mindepth 1 -type d | while read BOOK; do
        pushd .
        cd "$BOOK"
        convert * "$here/$BOOK.pdf"
        popd
done

cd $here

rm -rf ${tmp}
