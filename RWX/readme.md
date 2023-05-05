


1. Add the google helm repo
    helm repo add stable https://kubernetes-charts.storage.googleapis.com/
    
2. Update the repo information
    helm repo update

3. Search the repo
    helm search repo stable

4. Review the information regarding the nfs-server-provisioning

5. Install the nfs-server-provisioning
    helm install nfs-server stable/nfs-server-provisioner --set persistence.enabled=true,persistence.storageClass=do-block-storage,persistence.size=200Gi
        
6. Review that the container is working
    kubectl get pods

7. Review that the storageclass is created
    kubectl get storageclass

8. Create an application that uses that storageclass (use the nginx-sc.yaml from this git)
