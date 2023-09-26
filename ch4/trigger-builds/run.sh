#!/bin/bash 

URL="https://api.ocp4.example.com:6443/apis/build.openshift.io/v1/namespaces/bc-demo-project/buildconfigs/bcdemo/webhooks/FPrC_bf_Q7FOszS5rwqm/github"


curl -X POST -k -H "X-GitHub-Event: push" -H "Content-Type: application/json" -d '{"ref":"refs/heads/main"}' ${URL} 
