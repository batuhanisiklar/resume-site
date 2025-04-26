pipeline {
    agent any

    environment {
        IMAGE_NAME = 'resumeSite_container'    // Docker image ismi
        CONTAINER_NAME = 'resumeSite'   // Container ismi
    }

    stages {
        stage('Pull Git Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/batuhanisiklar/resumeSite.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Stop Old Container') {
            steps {
                script {
                    sh """
                    if [ \$(docker ps -q -f name=$CONTAINER_NAME) ]; then
                        docker stop $CONTAINER_NAME
                        docker rm $CONTAINER_NAME
                    fi
                    """
                }
            }
        }
        stage('Run New Container') {
            steps {
                sh 'docker run -d --name $CONTAINER_NAME -p 8081:80 $IMAGE_NAME'
            }
        }
    }
}
