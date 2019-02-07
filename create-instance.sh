#!/usr/bin/env bash

PROJECT=$1
INSTANCE_NAME=$2
MACHINE_TYPE=${3:-g1-small}
ZONE=${4:-us-central1-c}

gcloud compute --project ${PROJECT} instances create ${INSTANCE_NAME} \
  --zone ${ZONE} \
  --machine-type "${MACHINE_TYPE}" \
  --subnet "default" \
  --maintenance-policy "TERMINATE" \
  --scopes "https://www.googleapis.com/auth/cloud-platform" \
  --min-cpu-platform "Automatic" \
  --tags "http-server" \
  --image-family "ubuntu-1604-lts" \
  --image-project "ubuntu-os-cloud" \
  --boot-disk-size "45" \
  --boot-disk-device-name "${INSTANCE_NAME}-disk" \
  --metadata-from-file startup-script=startup.sh
