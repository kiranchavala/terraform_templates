apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${container_name}
  labels:
    app: ${container_name}
spec:
  selector:
    matchLabels:
      app: ${container_name}
  replicas: ${replicas} # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: ${container_name}
    spec:
      containers:
      - name: ${container_name}
        image: ${image_name}
        ports:
        - containerPort: ${container_port}