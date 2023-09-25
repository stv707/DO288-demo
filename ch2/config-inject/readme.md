
* use oc command to create project and deploy the nodejs app 

```bash 
oc new-project ch2-demo3-inject-config

oc get all

oc new-app --name child-apache --image=quay.io/stv707/do288-apache-child:v0

oc expose service/child-apache

curl child-apache-ch2-demo1.apps.ocp4.example.com

```
