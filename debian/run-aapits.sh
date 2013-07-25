#!/bin/bash
#
#       run the AAPITS tests
#
#       this script assumes it is in the source 'tests' directory at
#       start.
#

set -x

TSTDIR="$1"
BINDIR="$2"

# set up the tests
cd $TSTDIR
make
cd asl
ASL=$BINDIR/iasl make

# run the rests
cd $TSTDIR
cd bin
./aapitsrun
[ $? -eq 0 ] || exit 1

exit 0
