#!/bin/bash
#
#       run the misc tests: we need to do this in a script since
#       these are expected to fail which would normally cause %check
#       to stop.  however, this is expected behavior.  we are running
#       iasl precisely because we expect it to stop when presented with
#       faulty ASL.
#
#       this script assumes it is in the root of the  source directory at
#       start.
#

set -x

CURDIR="$1"
BINDIR="$1/generate/unix/bin"
DEBDIR="$1/debian"
VERSION="$2"

cd $CURDIR/tests/misc

# create files to compare against
$BINDIR/iasl -h

m=`uname -m`
case $m in
    s390x | \
    *64) BITS=64
         ;;
    *)   BITS=32
         ;;
esac

# if the build happens to start before midnight, the date gets
# confused in the comparison later on if the build goes past
# midnight.  grab the date from the iasl file we just built so
# they match regardless.
FDATE=`stat --format="%Y" $BINDIR/iasl | cut -d" " -f1`
WHEN=`date --date="@$FDATE" +"%b %_d %Y"

sed -e "s/XXXXXXXXXXX/$WHEN/" \
    -e "s/YYYY/$BITS/" \
    -e "s/VVVVVVVV/$VERSION/" \
    $DEBDIR/badcode.asl.result > badcode.asl.result
sed -e "s/XXXXXXXXXXX/$WHEN/" \
    -e "s/YYYY/$BITS/" \
    -e "s/VVVVVVVV/$VERSION/" \
    $DEBDIR/grammar.asl.result > grammar.asl.result

# see if badcode.asl failed as expected
# NB: the -f option is required so we can see all of the errors
$BINDIR/iasl -f badcode.asl 2>&1 | tee badcode
diff badcode badcode.asl.result >/dev/null 2>&1
[ $? -eq 0 ] || exit 1

# see if grammar.asl failed as expected
# NB: the -f option is required so we can see all of the errors
$BINDIR/iasl -f -of grammar.asl 2>&1 | tee grammar
diff grammar grammar.asl.result >/dev/null 2>&1
[ $? -eq 0 ] || exit 1

exit 0
