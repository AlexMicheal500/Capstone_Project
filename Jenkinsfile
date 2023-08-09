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
                    // Build and start the application using docker-compose
                    sh "docker-compose -f docker-compose.yml -p capstone-project up -d --build"
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

