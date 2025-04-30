pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/batuhanisiklar/resumeSite.git'
            }
        }

        stage('Stop & Remove Old Containers') {
            steps {
                sh 'docker-compose down'
            }
        }

        stage('Build & Start Containers') {
            steps {
                sh 'docker-compose up --build -d'
            }
        }
    }
}
