* Blue/Green Example 

* Deploy Blue App 
```bash
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