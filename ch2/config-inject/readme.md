
* use oc command to create project and deploy the nodejs app 

```bash 
oc new-project ch2-demo3-inject-config

oc get all

oc new-app --as-deployment-config --name myapp https://github.com/stv707/DO288-demo#main --context-dir ch2/config-inject

oc expose service/myapp

curl  myapp-ch2-demo3-inject-config.apps.ocp4.example.com

```

* create config map and secret and inject into application

```bash
oc create configmap varone --from-literal VAR1="do or do not, no try"

oc create configmap vartwo --from-literal VAR2="Join the Dark Side"

oc set env deploymentconfig/myapp --from cm/varone

curl  myapp-ch2-demo3-inject-config.apps.ocp4.example.com

oc set env deploymentconfig/myapp --from cm/vartwo 

curl  myapp-ch2-demo3-inject-config.apps.ocp4.example.com

oc create secret generic --from-literal=SEC3=order66 sec3

oc get secrets sec3 -o json

echo <secret_base64> | base64 -d

oc set env deploymentconfig/myapp --from secret/sec3

curl  myapp-ch2-demo3-inject-config.apps.ocp4.example.com

```
