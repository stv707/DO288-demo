* build the base-image
``
podman build  -t do288-basic-apache:v0 .
``

* push the image to quay.io

```bash

podman login -u="stv707" -p="<token>" quay.io

podman tag localhost/do288--basic-apache:v0  quay.io/stv707/do288-basic-apache:v0

podman push quay.io/stv707/do288-basic-apache:v0

```

