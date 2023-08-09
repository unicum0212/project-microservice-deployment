#!/usr/bin/env groovy

pipeline {
    agent any
    tools {
        terraform 'terraform'
    }

    stages {
        stage('test') {
            steps {
                script {
                    echo "success"
                }
            }
        }
    }
}