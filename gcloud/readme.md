gcloud init
gcloud services enable container.googleapis.com
gcloud container cluster create demo
gcloud components install gke-gcloud-auth-plugin
gcloud container clusters get-credentials demo

k create deploy demo --image gcr.io/k8s-k3s/demo:v1.0.0 #Create a deployment
k expose deploy demo --port 80 --type LoadBalancer --target-port 8080 #Expose the deployment
LB=$(k get svc demo -o jsonpath="{.status.loadBalancer.ingress[0].ip}") #Get the load balancer IP
k set image deploy demo demo=gcr.io/k8s-k3s/demo:v2.0.0 #Update the deployment


# Set the project ID
export PROJECT_ID=<your-project-id>

# Create the service account
gcloud iam service-accounts create my-service-account --project=$PROJECT_ID

# Assign the Artifact Registry Reader role to the service account
gcloud projects add-iam-policy-binding $PROJECT_ID --member=serviceAccount:my-service-account@$PROJECT_ID.iam.gserviceaccount.com --role=roles/artifactregistry.reader

# Create the JSON key
gcloud iam service-accounts keys create key.json \
--iam-account my-service-account@$PROJECT_ID.iam.gserviceaccount.com

# Create the Kubernetes Secret
kubectl create secret docker-registry my-secret \
--docker-server=us-central1-docker.pkg.dev \
--docker-username=_json_key \
--docker-password="$(cat key.json)" \
--docker-email=slobodenuk@gmail.com

# Commands to build and push the image
docker build -f Dockerfile .
docker tag bee4dd26e2bf us-central1-docker.pkg.dev/k8s-k3s-405407/demo/demo.v1.0.0
gcloud auth configure-docker us-central1-docker.pkg.dev
docker push us-central1-docker.pkg.dev/k8s-k3s-405407/demo/demo.v1.0.0


k create ns demo #Create a namespace
k config set-context --current --namespace=demo #Set the namespace
k create deployment demo --image=us-central1-docker.pkg.dev/k8s-k3s-405407/demo/demo.v1.0.0 #Create a deployment
k get deploy #Get deployments

