#!/bin/sh

NAMESPACE="argocd"
RELEASE="argocd"
CHART="argo/argo-cd"
REPO_URL="https://argoproj.github.io/argo-helm"
REPO_NAME="argo"

if ! command -v helm >/dev/null 2>&1; then
  echo "Helm is not installed"
  exit 1
fi


helm repo add ${REPO_NAME} ${REPO_URL}
helm repo update

helm upgrade --install ${RELEASE} ${CHART} \
  --namespace ${NAMESPACE} \
  --create-namespace

echo "Argo CD installed successfully"




if ! command -v kubectl >/dev/null 2>&1; then
  echo "Kubectl is not installed"
  exit 1
fi

kubectl apply -f argocd-app.yaml -n ${NAMESPACE}
