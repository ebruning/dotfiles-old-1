#!/usr/bin/env bash

for file in `find . -print | grep -i '.*[.]tif'`; do
  DIR=$(dirname "${file}")
  echo "processing $file"
  curl -s -X "PUT" "172.31.1.117/mobilesdk/api/citibillpay?fieldAlternatives=true" \
        -H "Content-Type: image/tiff" --upload-file $file >$DIR/response_with_alternatives.json
done
