pipeline {
    agent {
        label "docker-agent-alpine"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build and Deploy') {
            steps {
                script {
                    sh "apt  install docker-compose"
                    // Build and start the application using docker-compose
                    sh "docker-compose up -d"
                }
            }
        }
    }
    
    post {
        always {
            // Stop and remove containers after pipeline completion
            sh "docker-compose down"
        }
    }
}

