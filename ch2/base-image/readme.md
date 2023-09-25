* build the base-image

```bash 
podman build --format docker  -t do288-apache:v0 .
```

* push the image to quay.io

```bash

podman login -u="stv707" -p="<token>" quay.io

podman tag localhost/do288-apache:v0  quay.io/stv707/do288-apache:v0

podman push quay.io/stv707/do288-apache:v0

```

* verify the pushed image ( do288-apache:v0 ) is in your quay.io registry. 
>> use web browser 


### END 