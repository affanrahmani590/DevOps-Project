pipeline {
    agent any

    environment {
        APP_PORT = '8000' 
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
                    def containerExists = sh(script: "docker ps -a -q -f name=${CONTAINER_NAME}", returnStdout: true).trim()
                    if (containerExists) {
                        sh "docker stop ${CONTAINER_NAME} || true"
                        sh "docker rm ${CONTAINER_NAME} || true"
                    }
                }
            }
        }

        // 4. Run new container
        stage('Deploy') {
            steps {
                sh "docker run -d --name ${CONTAINER_NAME} -p ${APP_PORT}:${APP_PORT} ${IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
