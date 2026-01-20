#!/bin/sh

SECRET_NAME="mimir-s3-creds"
NAMESPACE="monitoring"

if ! command -v kubectl >/dev/null 2>&1; then
  echo "Error: kubectl is not installed"
  exit 1
fi


if [ "$#" -ne 2 ]; then
  echo "Error: Incorrect number of arguments."
  echo "Usage:  $0 <aws_access_key_id> <aws_secret_access_key>"
  exit 1
fi

ACCESS_KEY_ID="$1"
SECRET_ACCESS_KEY="$2"

kubectl create secret generic "$SECRET_NAME" \
  --from-literal=AWS_ACCESS_KEY_ID="$ACCESS_KEY_ID" \
  --from-literal=AWS_SECRET_ACCESS_KEY="$SECRET_ACCESS_KEY" \
  -n "$NAMESPACE" \
  --dry-run=client -o yaml | kubectl apply -f -


if [ $? -eq 0 ]; then
  echo "Secret '$SECRET_NAME' created or updated in namespace '$NAMESPACE'."
else
  echo "Failed to create or update secret '$SECRET_NAME'."
  exit 1
fi
