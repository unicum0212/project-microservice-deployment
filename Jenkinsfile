pipeline {
    agent any
    tools {
        terraform 'terraform'
    }

    environment {
        DOCKER_REPO_SERVER = "648494430292.dkr.ecr.eu-central-1.amazonaws.com"
    }
    stages {
        stage('build images') {
            steps {
                echo "building the docker images.."
                git branch: 'master', credentialsId: 'github-ssh', url: 'git@github.com:unicum0212/microservice-project-app.git'
                withCredentials([usernamePassword(credentialsId: 'ecr-creds', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin ${DOCKER_REPO_SERVER}"
                    dir("frontend") {
                        sh "docker build -t ${DOCKER_REPO_SERVER}/frontend:latest ."
                        sh "docker push ${DOCKER_REPO_SERVER}/frontend:latest"
                    }
                    dir("auth-api") {
                        sh "docker build -t ${DOCKER_REPO_SERVER}/auth-api:latest ."
                        sh "docker push ${DOCKER_REPO_SERVER}/auth-api:latest"
                    }
                    dir("log-message-processor") {
                        sh "docker build -t ${DOCKER_REPO_SERVER}/log-message-processor:latest ."
                        sh "docker push ${DOCKER_REPO_SERVER}/log-message-processor:latest"
                    }
                    dir("todos-api") {
                        sh "docker build -t ${DOCKER_REPO_SERVER}/todos-api:latest ."
                        sh "docker push ${DOCKER_REPO_SERVER}/todos-api:latest"
                    }
                    dir("users-api") {
                        sh "docker build -t ${DOCKER_REPO_SERVER}/users-api:latest ."
                        sh "docker push ${DOCKER_REPO_SERVER}/users-api:latest"
                    }
                }
            }
        }
        stage("build infrastructure"){
            steps {
                git branch: 'main', credentialsId: 'github-ssh', url: 'git@github.com:unicum0212/project-microservice-deployment.git'                
                dir("terraform") {
                    sh "terraform init"
                    sh "terraform apply -no-color -auto-approve"
                }
            }
        }
        stage("deploy deployments and services") {
            steps {
                sh "aws eks update-kubeconfig --name microservice-eks-cluster"
                sh "chmod +x install.sh"
                sh "./install.sh"
            }
        }
        stage("deploy ingress") {
            steps {
                sh "kubectl apply -f https://projectcontour.io/quickstart/contour.yaml"
                sh "kubectl apply -f k8s/ingress.yaml"
            }
        }
    }
}
