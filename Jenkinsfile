pipeline {
    agent any

    tools {
        // Using the tool name you specified. Ensure this exact name
        // is configured in Manage Jenkins > Global Tool Configuration.
        maven 'jenkins_maven'
    }

    stages {
        stage('Checkout Source') {
            steps {
                echo 'Cloning repository...'
                // Ensure your job configuration is set to main branch
                git branch: 'main', url: 'https://github.com/Yeshwanth-develops/CRUD.git'
            }
        }

        stage('Build JAR') {
            steps {
                script {
                    echo 'Building the application...'
                    // FIX: Using $M2_HOME/bin/mvn for better reliability,
                    // which is set automatically by the 'tools' directive.
                    sh "$M2_HOME/bin/mvn clean package -DskipTests"
                }
            }
        }

        // FIX: This stage is now correctly placed inside the 'stages' block.
        stage('Build & Push Docker Image') {
            steps {
                script {
                    echo 'Building and pushing Docker image...'
                    
                    // The withCredentials block handles Docker Hub login credentials
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-id', 
                                                    usernameVariable: 'USERNAME', 
                                                    passwordVariable: 'PASSWORD')]) {
                        
                        // 1. Build the image (assuming your Dockerfile is in the root)
                        sh "docker build -t $USERNAME/crud-app:latest ."
                        
                        // 2. Login to Docker Hub using the credential variables
                        sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                        
                        // 3. Push the image
                        sh "docker push $USERNAME/crud-app:latest"
                    }
                }
            }
        }
        
        stage('Deploy (Placeholder)') {
            steps {
                echo 'Image pushed. Add your deployment logic here (e.g., SSH to server, pull, and restart).'
                // Example for remote SSH deployment:
                // sh 'ssh user@remote-server "docker pull mydockerhubuser/myapp:latest && docker restart myapp"'
            }
        }
    }
}
