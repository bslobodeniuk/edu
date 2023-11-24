alias k=kubectl

k create deploy demo --image ghcr.io/bslobodeniuk/kbot:v1.0.0-17aeb78-arm64
k create deploy demo --image bslobodenuk/demo:v.0.0.1
k get pods
k get deployments -o wide
k exec -it deploy/demo -- sh
k expose deploy/demo --port 80 --target-port 8080
k get svc
k get ep
k port-forward svc/demo 8088:80&
curl localhost:8088

k logs deploy/demo

k config current-context #get current context
k config get-contexts #get all contexts
k config set-context --current --namespace=dev #set namespace for current context
k config use-context dev #switch context
