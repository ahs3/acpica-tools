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

BINDIR="$1/generate/unix/bin"
DEBDIR="$1/debian"
MISCDIR="$1/tests/misc"
VERSION="$2"

# create files to compare against
$BINDIR/iasl -h

m=`uname -m`
case $m in
    *64) BITS=64
         ;;
    *)   BITS=32
         ;;
esac
WHEN=`date +"%b %_d %Y"`
sed -e "s/XXXXXXXXXXX/$WHEN/" \
    -e "s/YYYY/$BITS/" \
    -e "s/VVVVVVVV/$VERSION/" \
    $DEBDIR/badcode.asl.result > $MISCDIR/badcode.asl.result
sed -e "s/XXXXXXXXXXX/$WHEN/" \
    -e "s/YYYY/$BITS/" \
    -e "s/VVVVVVVV/$VERSION/" \
    $DEBDIR/grammar.asl.result > $MISCDIR/grammar.asl.result

# see if badcode.asl failed as expected
# NB: the -f option is required so we can see all of the errors
$BINDIR/iasl -f $MISCDIR/badcode.asl 2>&1 | tee $MISCDIR/badcode
diff $MISCDIR/badcode $MISCDIR/badcode.asl.result >/dev/null 2>&1
[ $? -eq 0 ] || exit 1

# see if grammar.asl failed as expected
# NB: the -f option is required so we can see all of the errors
$BINDIR/iasl -f -of $MISCDIR/grammar.asl 2>&1 | tee $MISCDIR/grammar
diff $MISCDIR/grammar $MISCDIR/grammar.asl.result >/dev/null 2>&1
[ $? -eq 0 ] || exit 1

exit 0
