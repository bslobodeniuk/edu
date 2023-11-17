gcloud auth login
docker build .
docker images
docker tag bee4dd26e2bf446514b71 gcr.io/k8s-k3s/demo:v.0.0.1
gcloud config set project k8s-k3s
gcloud artifacts repositories create demo --repository-format=docker --location=us --description="Repo for demo"

docker push gcr.io/k8s-k3s/demo:v.0.0.1

#for docker hub
docker tag bee4dd26e2bf446514b71 bslobodenuk/demo:v.0.0.1
docker push bslobodenuk/demo:v.0.0.1