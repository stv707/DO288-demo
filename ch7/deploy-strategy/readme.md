### Blue/Green Example 

* Deploy Blue App 
```bash
oc new-project bluegreen-project

oc get all 

oc new-app --name blue --image=docker.io/openshift/hello-openshift

oc set env deployment blue  RESPONSE="Hello from Blue"

oc expose service/blue --name=bluegreen

curl <route>

```

* Deploy Green 
```bash 
oc new-app --name green --image=docker.io/openshift/hello-openshift

oc set env deployment green RESPONSE="Hello from Green"

oc set route-backends bluegreen blue=0 green=100

curl <route>

```

### Rolling deployment

* Rolling deployment is the default deployment strategy in OpenShift. In short, this process is about slowly replacing currently running instances of our application with newer ones

* Demo

* Create V1 of kubia app and scale to 6 instances of pod 

```bash 
oc new-project kubia-project

oc new-app --name kubia --as-deployment-config --image=docker.io/stv707/kubia:v1

oc expose deployment kubia --port 8080

oc expose service kubia

curl <route> 

oc scale deploymentconfig kubia --replicas=6

***loop the curl to confirm all pod are load balanced*** 

oc import-image kubia --confirm --all --from docker.io/stv707/kubia

```

















