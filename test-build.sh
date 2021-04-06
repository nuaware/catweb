#!/bin/bash

echo "### Running catweb container locally"
docker run --rm -d --name catweb -p 8080:8080 registry:5000/catweb


curl -s http://172.17.0.1:8080 | grep -i nuaware
if [ $? -ne 0 ]; then
   echo "  ### Webpage check failed"
   CURL_EXIT=1
fi

echo "### Performing cleanup"
docker kill catweb

exit $CURL_EXIT
