helm install -f k8s/values/auth-api.yaml auth-api k8s/charts/microservices
helm install -f k8s/values/frontend.yaml frontend k8s/charts/microservices
helm install -f k8s/values/log-message-processor.yaml log-message-processor k8s/charts/log-message-processor
helm install -f k8s/values/redis.yaml redis k8s/charts/redis-queue
helm install -f k8s/values/todos-api.yaml todos-api k8s/charts/microservices
helm install -f k8s/values/users-api.yaml users-api k8s/charts/microservices
helm install -f k8s/values/zipkin.yaml zipkin k8s/charts/microservices