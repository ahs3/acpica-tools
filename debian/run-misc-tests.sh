#!/bin/bash
#
#       run the misc tests: we need to do this in a script since
#       these are expected to fail which would normally cause %check
#       to stop.  however, this is expected behavior.  we are running
#       iasl precisely because we expect it to stop when presented with
#       faulty ASL.
#
#       this script assumes it is in the source 'tests' directory at
#       start.
#

set -x

BINDIR="$1"
echo BINDIR $BINDIR

# create files to compare against
$BINDIR/iasl --help

m=`uname -m`
case $m in
    *64) BITS=64
         ;;
    *)   BITS=32
         ;;
esac
WHEN=`date +"%b %d %Y"`
sed -e "s/XXXXXXXXXXX/$WHEN/" \
    -e "s/YYYY/$BITS/" \
    ../badcode.asl.result > misc/badcode.asl.result
sed -e "s/XXXXXXXXXXX/$WHEN/" \
    -e "s/YYYY/$BITS/" \
    ../grammar.asl.result > misc/grammar.asl.result

cd misc

# see if badcode.asl failed as expected
$BINDIR/iasl badcode.asl > badcode 2>&1
diff badcode badcode.asl.result >/dev/null 2>&1
[ $? -eq 0 ] || exit 1

# see if grammar.asl failed as expected
$BINDIR/iasl -f -of grammar.asl > grammar 2>&1
diff grammar grammar.asl.result >/dev/null 2>&1
[ $? -eq 0 ] || exit 1

exit 0
