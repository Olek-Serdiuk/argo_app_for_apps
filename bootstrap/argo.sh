#!/bin/bash
set -ex
kubectl create namespace argocd
kubectl apply -n argocd -f ../platform_plugins/argocd/install.yaml
sleep 30
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
# kubectl apply -n argocd -f app_of_apps.yml
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
kubectl port-forward svc/argocd-server -n argocd 8080:443


# kubectl argo rollouts promote demo-app-bg