* OCP BuildConfig Trigger

* Run oc new-app to create a buildconfig and verify

```bash
oc new-project bc-demo-project

oc new-app --name bcdemo  --build-env MAVEN_MIRROR_URL=http://nexus-common.apps.ap410.prod.ole.redhat.com/repository/java  -i redhat-openjdk18-openshift:1.8 https://github.com/stv707/DO288-demo.git#main --context-dir ch4/trigger-builds

oc get all

oc logs bc/bcdemo -f

oc expose service/bcdemo

oc get routes 

curl bcdemo-bc-demo-project.apps.ocp4.example.com

```

* examine the default trigger

```bash
oc describe bc bcdemo  | grep Strategy  -A 14

```

* Explore the webhook in GitHub 

* Simulate git push trigger 
>> Since we don't have direct access to OCP in training, we will use the curl command to trigger a build after the push

 1. contruct the curl url 
 ```bash 
 oc describe bc bcdemo  | grep 'Webhook GitHub' -A 1

 https://api.ocp4.example.com:6443/apis/build.openshift.io/v1/namespaces/bc-demo-project/buildconfigs/bcdemo/webhooks/<secret>/github

 ```

 2. get the secret data
 ```bash 
 oc get bc bcdemo -o yaml  | grep 'github:' -A 1
 
 ```
 3. using the url and secret construct the curl command in a Shell Script 

 ```bash 
 vim run.sh 

 #!/bin/bash

 URL="https://api.ocp4.example.com:6443/apis/build.openshift.io/v1/namespaces/bc-demo-project/buildconfigs/bcdemo/webhooks/xxxxxxxxx/github"

 curl -X POST -k -H "X-GitHub-Event: push" -H "Content-Type: application/json" -d '{"ref":"refs/heads/main"}' ${URL}
 
 ```
 4. update the source code [ src/main/java/com/redhat/training/example/javaserverhost/rest/ServerHostEndPoint.java ] 

 change: 
 ```bash 
 String msg = "I am running on server "+host+" Version 1.0 \n";
 ```
 to 
 ```bash 
 String msg = "I am running on server "+host+" Version 2.X \n";
 ```













