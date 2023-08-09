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
                    
                    sh "docker"
                    // sh "curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose"
                    // sh "chmod +x /usr/local/bin/docker-compose"
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

