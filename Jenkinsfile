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
                        sh "docker build -t ${DOCKER_REPO_SERVER}/frontend:latest"
                        sh "docker push ${DOCKER_REPO_SERVER}/latest"
                    }
                }
            }
        }
    }
}