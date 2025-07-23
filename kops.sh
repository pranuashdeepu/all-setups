#vim .bashrc
#export PATH=$PATH:/usr/local/bin/
#source .bashrc


#! /bin/bash
aws configure
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.32.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops

aws s3api create-bucket --bucket raja5637dogeecloudanddevopsbyraham0073456.k8s.local --region us-east-1
aws s3api put-bucket-versioning --bucket raja5637dogeecloudanddevopsbyraham0073456.k8s.local --region us-east-1 --versioning-configuration Status=Enabled
export KOPS_STATE_STORE=s3://raja5637dogeecloudanddevopsbyraham0073456.k8s.local
kops create cluster --name pranu.k8s.local --zones us-east-1a --image ami-05ffe3c48a9991133  --control-plane-count=1 --control-plane-size t2.large --node-count=2 --node-size t2.medium
kops update cluster --name pranu.k8s.local --yes --admin
