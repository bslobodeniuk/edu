alias k=kubectl
k create deploy demo --image bslobodenuk/app:v0.0.1
k create deploy demo --image bslobodenuk/demo:v.0.0.1
k get pods
k get deployments -o wide
k exec -it deploy/demo -- sh
k expose deploy/demo --port 80 --target-port 8080
k get svc
k get ep
k port-forward svc/demo 8088:80&
k logs deploy/demo