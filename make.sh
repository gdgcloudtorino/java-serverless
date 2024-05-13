#!/bin/bash
cd quarkus
gcloud builds submit --region europe-west1 --config cloudbuild.yaml --substitutions=COMMIT_SHA=latest &
cd ../spring
gcloud builds submit --region europe-west1 --config cloudbuild.yaml --substitutions=COMMIT_SHA=latest &