### Kubernetes deployment
1. Create namespace "regula"
```
kubectl create namespace regula
```

2. Import secret "regula.license"
```
kubectl create secret generic license -n regula --from-file=regua.license
```

3. Run deployment
```
kubectl apply -f https://raw.githubusercontent.com/regulaforensics/dockerhub/master/face-api/k8face-api.yml
```
