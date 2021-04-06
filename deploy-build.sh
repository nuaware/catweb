#!/bin/bash

ENABLED=false

if [[ $ENABLED == true ]]; then
   echo "### Pushing image to container registry"
   docker push registry:5000/catweb

   echo "### Deploying to Kubernetes"
   kubectl delete deployment catweb > /dev/null 2>&1
   kubectl apply -f ./deployment.yaml

   DEPLOY_STATUS="NotReady"
   counter=0
   while [[ $DEPLOY_STATUS != "Running" ]]; do
      DEPLOY_STATUS=`kubectl get pods | tail -1 | awk '{print $3}'`
      sleep 2
      counter=$((counter+1))
      if [[ "$counter" -gt 10 ]]; then
        echo "Pod(s) did not reach Running state within the timeout period."
        exit 1
      fi
   done
fi

exit 0
