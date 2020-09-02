### Kubernetes deployment
1. Create the namespace "regula"
```
kubectl create namespace regula
```

2. Import the secret "regula.license"
```
kubectl create secret generic license -n regula --from-file=regua.license
```

3. Run the deployment
```
kubectl apply -f https://raw.githubusercontent.com/regulaforensics/dockerhub/master/docreader/k8docreader.yml
```
