set -e

NAME="kubernetes-pipeline-api"
USERNAME="thiagge"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker Image..."
docker build -t $IMAGE .

echo "Pushing image to Docker Hub..."
docker push $IMAGE

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/services.yaml

echo "Getting pods..."
kubectl get pods

echo "Getting services..."
kubectl get services

echo "Fetching the main services..."
kubectl get services $NAME-service