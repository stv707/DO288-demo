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
