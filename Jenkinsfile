#!/usr/bin/env groovy

pipeline {
    agent any
    tools {
        terraform 'terraform'
    }

    stages {
        stage('build images') {
            steps {
                echo "building the docker images.."
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-creds', url: 'https://github.com/unicum0212/microservice-project-app.git']])
                pwd
            }
        }
    }
}