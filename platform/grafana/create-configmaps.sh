if ! command -v kubectl >/dev/null 2>&1; then
  echo "Kubectl is not installed"
  exit 1
fi

kubectl create configmap grafana-dashboard --from-file=test-dashboard.json --namespace monitoring