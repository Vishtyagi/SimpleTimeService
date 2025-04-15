#!/bin/bash

# Exit on error
set -e

# Variables
CLUSTER_NAME="eks-simple-time-service"  
REGION="us-east-1"      
EKS_ADMIN_POLICY_NAME="arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

read -p "Enter the IAM Role/User ARN (or press Enter to use the current caller identity): " INPUT_ARN

echo "Using IAM Role/User ARN: $INPUT_ARN"

aws eks associate-access-policy \
  --cluster-name "$CLUSTER_NAME" \
  --principal-arn "$INPUT_ARN" \
  --access-scope type=cluster \
  --policy-arn "$EKS_ADMIN_POLICY_NAME" \
  --region "$REGION"

echo "Access policy $ACCESS_POLICY_ARN successfully associated for Principal ARN: $PRINCIPAL_ARN in cluster: $CLUSTER_NAME"

aws eks create-access-entry \
  --cluster-name "$CLUSTER_NAME" \
  --principal-arn "$INPUT_ARN" \
  --region "$REGION"

echo "Access entry created for Principal ARN: $INPUT_ARN in cluster: $CLUSTER_NAME"


aws eks update-kubeconfig \
  --name "$CLUSTER_NAME" \
  --region "$REGION"

echo "Kubeconfig updated for cluster: $CLUSTER_NAME in region: $REGION"


