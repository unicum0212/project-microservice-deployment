pipeline {
    agent any
    tools {
        terraform 'terraform'
    }

    stages {
        stage('build images') {
            steps {
                echo "building the docker images.."
                git branch: 'master', credentialsId: 'github-ssh', url: 'git@github.com:unicum0212/microservice-project-app.git'
                sh 'ls -l'
            }
        }
    }
}