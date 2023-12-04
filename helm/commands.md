#### Add Argo helm repo
```bash
helm repo add argo https://argoproj.github.io/argo-helm 
```

#### Update helm repos
```bash
helm repo update argo 
```

#### Install Argo Workflows
```bash
helm install argo argo/argo-cd --namespace argo --create-namespace --version 5.16.13 --set server.service.type=LoadBalancer 
```

#### List helm releases
```bash
helm ls -n argo 
```
#### Helm
2. Install the application using Helm:
   helm install current-version ./helm

3. This will deploy a boundle of microservices, databases, message broker and api-gateway with service called "ambassador".

4. Forward the service port to your local machine:

kubectl port-forward svc/ambassador 8080:80

5. Test the application by running the following command:

curl localhost:8080/api/

6. You should get the current version of the api microservice in the response: k8sdiy-api:599e1af

Finally, try to set new version and deploy a microservice using the following command:

helm template new-version ./helm -s templates/api-deploy.yaml --set image.tag=build-802e329

#### New canary release
helm template new-version ./helm -s templates/api-deploy.yaml -s templates/api-svc.yaml -s templates/app-configmap.yaml -s templates/secret.yaml --set image.tag=build-802e329 --set api.canary=true --set api.header=x-special-version 
