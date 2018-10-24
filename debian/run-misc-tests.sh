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

BITS=$(dpkg-architecture -qDEB_HOST_ARCH_BITS)

# if the build happens to start before midnight, the date gets
# confused in the comparison later on if the build goes past
# midnight.  grab the date from the iasl file we just built so
# they match regardless.
FDATE=`stat --format="%Y" $BINDIR/iasl | cut -d" " -f1`
WHEN=`date --date="@$FDATE" +"%b %_d %Y"`

sed -e "s/VVVVVVVV/$VERSION/" \
    $DEBDIR/badcode.asl.result > badcode.asl.expected
sed -e "s/VVVVVVVV/$VERSION/" \
    $DEBDIR/grammar.asl.result > grammar.asl.expected
sed -e "s/VVVVVVVV/$VERSION/" \
    $DEBDIR/converterSample.asl.result > converterSample.asl.expected

# see if badcode.asl failed as expected
# NB: the -f option is required so we can see all of the errors
$BINDIR/iasl -f badcode.asl 2>&1 | tee badcode.asl.actual
diff badcode.asl.actual badcode.asl.expected >/dev/null 2>&1
[ $? -eq 0 ] || exit 1

# see if grammar.asl failed as expected
# NB: the -f option is required so we can see all of the errors
$BINDIR/iasl -f -of grammar.asl 2>&1 | tee grammar.asl.actual
diff grammar.asl.actual grammar.asl.expected >/dev/null 2>&1
[ $? -eq 0 ] || exit 1

# see if converterSample.asl failed as expected
# NB: the -f option is required so we can see all of the errors
$BINDIR/iasl -f -of converterSample.asl 2>&1 | tee converterSample.asl.actual
diff converterSample.asl.actual converterSample.asl.expected >/dev/null 2>&1
[ $? -eq 0 ] || exit 1

exit 0
