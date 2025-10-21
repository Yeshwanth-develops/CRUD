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
                withCredentials([usernamePassword(credentialsId: 'dockerhub-id', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker build -t Yeshwanth-develops/CRUD:latest .'
                    sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                    sh 'docker push Yeshwanth-develops/CRUD:latest'
                }
            }
        }
    }
  }
}

