# AssignmentHyperops
Technical Assignemt for HyperOps

- Prepare and submit WordPress application deployment manifestos in a Kubernetes environment (miniKube can be used).
- The application must be accessible via Ingress definition
- All pods in a namespace must be deployed on dedicated nodes, labeled role=db
- The application database must use PersistentVolume
- The PersistentVolume must remain when PersistentVolumeClaim is deleted
- The PersistentVolume must respect affinity rules and can only be bound to nodes that are labeled role=db\
- Application pods must contain resource requests and limits
- Application pods must contain health probes
- The database should run in HA mode

# Preriquisites: 
- minikube 1.26
- terraform 1.2.6
- minikube virtualization for multy node clusters
- **Start minikube cluster in multimode. Select preferered virtualization mode <--driver=hyperv>**:
```
  minikube start --nodes 2 -p hyperops --driver=hyperv --disk-size 10000mb --memory 3000mb --extra-config=apiserver.enable-admission-plugins=PodNodeSelector
```
- **Enable minikube ingress controler:**
```
  minikube addons enable ingress -p hyperops
```

# Run Project

- Clone Repo 
- Run : 
```
  terraform init
  terraform apply -auto-approve
```
- Access wordpress site via ingress service IP

# Remove everyting 
- Run :      
``` 
  minikube delete -p hyperops  
```

## Minicube commands 
- Stop minicube cluster : 
```
- minikube stop -p hyperops
```
- Delete Cluster :
```
  minikube delete -p hyperops
```  
- Start Kubernetes Dashboard:
```
minikube dashboard -p hyperops           
```









