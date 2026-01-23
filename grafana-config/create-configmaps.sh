if ! command -v kubectl >/dev/null 2>&1; then
  echo "Kubectl is not installed"
  exit 1
fi

kubectl apply -f node-dashboard-configmap.yaml -f node-datasource-configmap.yaml
