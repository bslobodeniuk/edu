alias k=kubectl
k completion -h #get help for completion
source <(kubectl completion zsh) # setup autocomplete in zsh into the current shell
source <(kubectl completion bash | sed s/kubectl/k/g)

k get componentstatuses #get health of cluster
k get all -A #get all resources in all namespaces

k create deploy demo --image ghcr.io/bslobodeniuk/kbot:v1.0.0-17aeb78-arm64
k create deploy demo --image bslobodenuk/demo:v.0.0.1
k get pods
k get deployments -o wide
k exec -it deploy/demo -- sh
k expose deploy/demo --port 80 --target-port 8080
k get svc
k get ep #get information about endpoints   #https://kubernetes.io/docs/concepts/services-networking/service/#services-without-selectors
k port-forward svc/demo 8088:80&
curl localhost:8088

k logs deploy/demo

k config current-context #get current context
k config get-contexts #get all contexts
#Current context set what context will be used by default when you run kubectl commands.
k config set-context --current --namespace=dev #set namespace for current context.
k config use-context dev #switch context
