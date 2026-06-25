pipeline {
    agent any

    environment {
        APP_PORT = '8085' // Changed external port to 8085
        CONTAINER_NAME = 'login-admin-app'
        IMAGE_NAME = 'login-admin-project:latest'
    }

    stages {
        // 1. Get latest code from GitHub
        stage('Checkout Code') {
            steps {
                cleanWs()
                checkout scm
            }
        }

        // 2. Build Docker image
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        // 3. Stop and remove old container if it exists
        stage('Cleanup Old Container') {
            steps {
                script {
                    // Stops and removes container only if it is already running
                    sh "docker stop ${CONTAINER_NAME} || true"
                    sh "docker rm ${CONTAINER_NAME} || true"
                }
            }
        }

        // 4. Run the new container with correct port mapping
        stage('Deploy Container') {
            steps {
                sh "docker run -d -p ${APP_PORT}:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
            }
        }
    }
}
