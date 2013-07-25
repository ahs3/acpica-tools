#!/bin/bash
#
#       run the AAPITS tests
#
#       this script assumes it is in the source 'tests' directory at
#       start.
#

set -x

CURDIR="$1"
VERSION="$2"
DEBDIR=$CURDIR/debian
TSTDIR=$CURDIR/tests/aapits

BINDIR=$CURDIR/generate/unix/bin

# set up the tests
cd $TSTDIR
make
cd asl
ASL=$BINDIR/iasl make

# run the rests
cd ../bin
./aapitsrun
[ $? -eq 0 ] || exit 1

exit 0
