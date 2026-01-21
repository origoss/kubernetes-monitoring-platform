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
### Mimir Deployment
```sh
cd mimir
```
#### aws credentials management
Create credentials secret
```sh
./create_mimir_s3_secret.sh <aws_access_key_id> <aws_secret_access_key>
```
