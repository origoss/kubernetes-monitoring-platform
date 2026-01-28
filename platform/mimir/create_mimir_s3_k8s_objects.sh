#!/bin/sh

SECRET_NAME="mimir-s3-creds"
NAMESPACE="monitoring"
CONFIGMAP_NAME="mimir-s3-bucket-name"

if ! command -v kubectl >/dev/null 2>&1; then
  echo "Error: kubectl is not installed"
  exit 1
fi


if [ "$#" -ne 3 ]; then
  echo "Error: Incorrect number of arguments."
  echo "Usage:  $0 <bucket-name> <aws_access_key_id> <aws_secret_access_key>"
  exit 1
fi

BUCKET_NAME="$1"
ACCESS_KEY_ID="$2"
SECRET_ACCESS_KEY="$3"

kubectl create secret generic "$SECRET_NAME" \
  --from-literal=AWS_ACCESS_KEY_ID="$ACCESS_KEY_ID" \
  --from-literal=AWS_SECRET_ACCESS_KEY="$SECRET_ACCESS_KEY" \
  --from-literal=BUCKET_NAME="$BUCKET_NAME" \
  -n "$NAMESPACE" \
  --dry-run=client -o yaml | kubectl apply -f -


if [ $? -eq 0 ]; then
  echo "Secret '$SECRET_NAME' created or updated in namespace '$NAMESPACE'."
else
  echo "Failed to create or update secret '$SECRET_NAME'."
  exit 1
fi
