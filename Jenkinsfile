pipeline {
    agent any
    tools {
        terraform 'terraform'
    }

    stages {
        stage('build images') {
            steps {
                echo "building the docker images.."
                git credentialsId: 'github-creds', url: 'https://github.com/unicum0212/microservice-project-app.git'
                dir('microservice-project-app/frontend') {
                    echo "some block"
                }
            }
        }
    }
}