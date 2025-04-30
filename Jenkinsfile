pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/batuhanisiklar/resumeSite.git'
            }
        }
        stage('Stop & Remove Old Containers') {
            steps {
                bat 'docker-compose down'
            }
        }
        stage('Build & Start Containers') {
            steps {
                bat 'docker-compose up --build -d'
            }
        }
    }
}
