#!/bin/bash

set -xeu -o pipefail

# release?
if [ -n "$TRAVIS_TAG" ]; then # tag found: releasing
  export version="$TRAVIS_TAG"
else
  export version="git$TRAVIS_COMMIT"
fi

for q in lq_ebur128 hq_ebur128 uhq_ebur128; do
  fname="fallout_1_2_${q}_music_${version}.zip"
  cp "LICENSE.md" "$q"
  cd "$q"
  zip "$fname" *
  mv "$fname" ..
  cd ..
done
