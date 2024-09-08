#!/bin/bash

# Remove the old types
rm -rf src/types/*

# Remove the old bindings
pushd ../cyberbus/crates
rm -rf **/bindings
popd

# First re-generate the types by running cargo test on cyberbus
pushd ../cyberbus/scripts
./test.sh

cd ../crates

# Copy them over to the types folder
cp api_common/bindings/* ../../cyberbus-js-client/src/types/
cp db_schema/bindings/* ../../cyberbus-js-client/src/types/
cp db_views/bindings/* ../../cyberbus-js-client/src/types/
cp db_views_actor/bindings/* ../../cyberbus-js-client/src/types/
cp db_views_moderator/bindings/* ../../cyberbus-js-client/src/types/
cp utils/bindings/* ../../cyberbus-js-client/src/types/

popd

# Remove the Sensitive type
rm src/types/Sensitive.ts

# Change all the bigints to numbers
find src/types -type f -name '*.ts' -exec sed -i 's/bigint/number/g' {} +

node putTypesInIndex.js

prettier -w src

