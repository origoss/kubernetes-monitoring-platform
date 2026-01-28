# kubernetes-monitoring-platform
## Cluster Management
Change directory
```sh
cd cluster
```
### Start Cluster
```sh
./cluster.sh start
```
### Stop Cluster
```sh
./cluster.sh stop
```
## Platform Management
```sh
cd platform
```
### Argo CD Deployment
```sh
cd argocd
./argocd.sh
```
### Grafana Deployment
```sh
cd grafana-config
./create-configmaps.sh
```
### Mimir Deployment
```sh
cd mimir
```
#### aws credentials management
Create and encrypt credentials secret
```sh
./create_mimir_s3_secret.sh <bucket-name> <aws_access_key_id> <aws_secret_access_key>
```
Argocd automatically applies the created sealed secret

