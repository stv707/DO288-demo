* inspect using skopeo 

```bash

 skopeo inspect docker://quay.io/stv707/do288-basic-apache:v0

 

```

* push the image to quay.io

```bash

podman login -u="stv707" -p="<token>" quay.io

podman tag localhost/do288-basic-apache:v0  quay.io/stv707/do288-basic-apache:v0

podman push quay.io/stv707/do288-basic-apache:v0

```

* use oc command to create project and deploy the basic-apache image and expose port 8080 service 

```bash 
oc new-project ch2-demo1

oc get all

oc new-app --name basic-apache --image=quay.io/stv707/do288-basic-apache:v0

oc expose service/basic-apache

curl basic-apache-ch2-demo1.apps.ocp4.example.com

```
