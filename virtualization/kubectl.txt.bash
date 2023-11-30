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

#https://kubernetes.io/docs/reference/kubectl/cheatsheet/
k get pods --all-namespaces #get all pods in all namespaces
k run nginx --image nginx --restart=Never --dry-run=client -o yaml |tee  > nginx-pod.yaml #create pod manifest
k create deploy nginx --image nginx --dry-run=client -o yaml |tee  > nginx-deploy.yaml #create deployment manifest

k get po --show-labels #get pods with labels

k api-resources #get all resources
k api-resources --namespaced=false #get all resources that are not namespaced
k api-resources --namespaced=true #get all resources that are namespaced

k get namespaces -v 7 #get namespaces with verbose output
k get ns -v 7 #get namespaces with verbose output
k get ns -v 8 #get namespaces with verbose output
k proxy #start proxy for kubernetes api to access it from browser

k get --raw='/readyz?verbose' #get health of cluster

k get pods -o wide --show-labels #get pods with wide output
k get rs -o wide --show-labels #get replicasets with wide output
k get deploy -o wide --show-labels #get deployments with wide output
k get po -lapp=nginx -Lapp #get pods with label app=nginx and show label app

k delete po nginx --grace-period=0 --force #delete pod nginx with force

k apply -f - <<EOF #create pod from stdin
k apply -f https://raw.githubusercontent.com/deploy.yaml #create pod from url

