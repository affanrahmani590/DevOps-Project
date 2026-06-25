pipeline {
    agent any

    environment {
        // App port 30000 is used in deployment.yaml, keeping this for documentation
        APP_PORT = '30000' 
        IMAGE_NAME = 'login-admin-project:latest'
    }

    stages {
        // 1. Get latest code from GitHub (including deployment.yaml)
        stage('Checkout Code') {
            steps {
                cleanWs()
                checkout scm
            }
        }

        // 2. Build Docker image locally
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        // 3. Deploy or Update the application in Kubernetes cluster
        stage('Deploy to Kubernetes') {
            steps {
                // This applies your deployment.yaml file automatically
                sh "kubectl apply -f deployment.yaml"
            }
        }

        // 4. Verify if the pods and services are running fine
        stage('Verify Deployment') {
            steps {
                sh "kubectl get pods"
                sh "kubectl get service login-admin-service"
            }
        }
    }
}
