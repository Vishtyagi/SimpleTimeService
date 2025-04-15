Task 1 :

Go to src folder and run below commands 

Build Image: docker build -t simpletimeservice:latest .  
Run Container: docker run -d --name simpletimeservice -p 8020:5000 simpletimeservice:latest
Access URL: curl http://localhost:8020/SimpleTimeService 


Task 2 : 

1. Navigate to TfstateResources folder which contains terraform configuration to create s3 bucket and dynamodb table for 
Remote backend and State Locking.
Run Terraform init 
Run Terraform apply -auto-approve

2. Navigate to Terraform folder to create EKS cluster

Run Terraform init 
Run Terraform apply -auto-approve

Wait for 20-25 min as EKS cluster creation takes time.

3. Navigate to root folder Execute IamAccess.sh to create an IAM access entry and to update the Kube config file or alternative is to create a IAM access entry in the cluster for your iam user or role with AmazonEKSClusterAdminPolicy from aws console and update the kubeconfig file with aws cli. 

4. Navigate to K8sManifests and run command 

Kubectl apply -f .

Run command : kubectl get service -n simple-web-app
Wait for sometime until LoadBalancer is provisioned

Copy the Load Balancer service DNS and Navigate to browser :

http://{LoadBalancerDNS}/SimpleTimeService




