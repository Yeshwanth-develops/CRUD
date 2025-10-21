pipeline {
    agent any 
    tools {
        maven : 'jenkins_maven'
    }
    stages {
        stage ("build jar") {
            steps {
                script {
                    echo "Building the application"
                    sh 'mvn package -DskipTests'
                }
            }
        }
    }
}
