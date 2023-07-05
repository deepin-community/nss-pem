#!/bin/sh

# clean old checkout
git rm -rf nss
rm -rf nss

git clone https://salsa.debian.org/mozilla-team/nss
rm -rf nss/.git*

VERSION=`dpkg-parsechangelog -l nss/debian/changelog | grep Version | sed 's/.* //'`

git add -f nss
git commit -m "Refresh nss

Package version: $VERSION
"
