#!/bin/bash

source /usr/local/etc/ocp4.config

APP_URL=myprobes-probe-demo.${RHT_OCP4_WILDCARD_DOMAIN}
curl http://$APP_URL/flip?op=kill-health
curl http://$APP_URL/flip?op=kill-ready
