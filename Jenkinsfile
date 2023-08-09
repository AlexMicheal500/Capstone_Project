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
#                    // Stop and remove existing containers from the same project
#                    sh "docker-compose -f ${DOCKER_COMPOSE_FILE} -p ${PROJECT_NAME} down"
                    
                    // Build and start the application using docker-compose
                    sh "docker-compose -f docker-compose.yml up -d --build"
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

