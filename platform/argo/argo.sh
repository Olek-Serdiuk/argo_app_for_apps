#!/bin/bash
kubectl create namespace argocd
kubectl apply -n argocd -f install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl apply -n argocd -f app_of_apps.yml


