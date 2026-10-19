pipeline {
    agent any

    environment {
        IMAGE_NAME = 'java-comparison-app'
        CONTAINER_NAME = 'java-app-container'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Automatically checks out code from the configured repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image tagged with the current build number
                    sh "docker build -t ${IMAGE_NAME}:${env.BUILD_NUMBER} ."
                    // Tag it as latest as well
                    sh "docker tag ${IMAGE_NAME}:${env.BUILD_NUMBER} ${IMAGE_NAME}:latest"
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Remove any existing container with the same name to avoid conflicts
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                    
                    // Run the container and view output in the console logs
                    sh "docker run --name ${CONTAINER_NAME} ${IMAGE_NAME}:${env.BUILD_NUMBER}"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
