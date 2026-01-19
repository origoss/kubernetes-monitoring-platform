#!/bin/sh

CLUSTER_NAME=kubernetes-monitoring-platform

if ! command -v kind >/dev/null 2>&1; then
  echo "kind is not installed"
  exit 1
fi

if kind get clusters | grep -q "^$CLUSTER_NAME$"; then
  echo "kind cluster already exists"
else
  kind create cluster --name "$CLUSTER_NAME"
fi
