pipeline {
    agent any 
    tools {
        maven 'jenkins_maven'
    }
    stages {
        stage("build jar") {
            steps {
                script {
                    echo "Building the application"
                    sh 'mvn package -DskipTests'
                }
            }
        }
         stage("build image") {
         steps {
            script {
                echo "Building Docker image"
                withCredentials([usernamePassword(credentialsId: 'dockerhub-id', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker build -t myapp:latest .'
                    sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                    sh 'docker push mydockerhubuser/myapp:latest'
                }
            }
        }
    }
  }
}

