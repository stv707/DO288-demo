* Deploy sample NodeJS app that has endpoints 
  - /ready  
  - /healthz 

```bash
oc new-project probe-demo

oc get all 

```

```bash 
oc new-app \
--name myprobes --context-dir ch7/probes --build-env \
npm_config_registry=http://nexus-common.apps.ap410.prod.ole.redhat.com/repository/nodejs \
nodejs:16-ubi8~https://github.com/stv707/DO288-demo
```

