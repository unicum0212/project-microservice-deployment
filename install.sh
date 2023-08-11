helm install -f k8s/values/auth-api.yaml auth-api charts/microservices
helm install -f k8s/values/frontend.yaml frontend charts/microservices
helm install -f k8s/values/log-message-processor.yaml log-message-processor charts/log-message-processor
helm install -f k8s/values/redis.yaml redis charts/redis-queue
helm install -f k8s/values/todos-api.yaml todos-api charts/microservices
helm install -f k8s/values/users-api.yaml users-api charts/microservices
helm install -f k8s/values/zipkin.yaml zipkin charts/microservices