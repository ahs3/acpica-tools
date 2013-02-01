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

CURDIR="$1"
DEBDIR=$CURDIR/debian
TSTDIR=$CURDIR/tests/misc

m=`uname -m`
case $m in
    *64) BITS=64
         ;;
    *)   BITS=32
         ;;
esac

BINDIR=$CURDIR/generate/unix/bin${BITS}

# create files to compare against
$BINDIR/iasl --help
WHEN=`date +"%b %d %Y"`
sed -e "s/XXXXXXXXXXX/$WHEN/" \
    -e "s/YYYY/$BITS/" \
    $DEBDIR/badcode.asl.result > $TSTDIR/badcode.asl.result
sed -e "s/XXXXXXXXXXX/$WHEN/" \
    -e "s/YYYY/$BITS/" \
    $DEBDIR/grammar.asl.result > $TSTDIR/grammar.asl.result

# see if badcode.asl failed as expected
$BINDIR/iasl $TSTDIR/badcode.asl > $TSTDIR/badcode 2>&1
diff $TSTDIR/badcode $TSTDIR/badcode.asl.result >/dev/null 2>&1
[ $? -eq 0 ] || exit 1

# see if grammar.asl failed as expected
$BINDIR/iasl -f -of $TSTDIR/grammar.asl > $TSTDIR/grammar 2>&1
diff $TSTDIR/grammar $TSTDIR/grammar.asl.result >/dev/null 2>&1
[ $? -eq 0 ] || exit 1

exit 0
