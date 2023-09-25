* build the base-image

```bash

podman build -t do288-apache-child:v0 .

```

* push the image to quay.io

```bash

podman login -u="stv707" -p="<token>" quay.io

podman tag localhost/do288-apache-child:v0 quay.io/stv707/do288-apache-child:v0

podman push quay.io/stv707/do288-apache-child:v0

```

* use oc command to create project and deploy the basic-apache image and expose port 8080 service 

```bash 
oc new-project ch2-demo2-child

oc get all

oc new-app --name child-apache --image=quay.io/stv707/do288-apache-child:v0

oc expose service/child-apache

curl child-apache-ch2-demo1.apps.ocp4.example.com

```
