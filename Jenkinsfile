pipeline {
    agent any

    environment {
        // Define environment variables
        APP_NAME = 'springboot-crud-app'
        REGISTRY = 'docker.io'
        IMAGE_NAME = "yeshwanthdevelops/${APP_NAME}"
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building Spring Boot application using Maven...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                echo 'Running unit tests...'
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    sh "docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin ${REGISTRY}
                        docker push ${IMAGE_NAME}:${BUILD_NUMBER}
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application (example stage)...'
                // You can replace this with actual deploy commands, like:
                // sh 'docker-compose up -d'
                // or SSH into a server and deploy
                echo "Deployed ${IMAGE_NAME}:${BUILD_NUMBER}"
            }
        }
    }

    post {
        success {
            echo "✅ Build #${BUILD_NUMBER} succeeded!"
        }
        failure {
            echo "❌ Build #${BUILD_NUMBER} failed. Check the logs."
        }
    }
}

pipeline {
    agent any

    tools {
        maven 'Maven_3.9'
        jdk 'Java_21'
    }

    environment {
        APP_NAME = "SpringBoot-CRUD"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "📦 Checking out code from GitHub..."
                git branch: 'main', url: 'https://github.com/Yeshwanth-develops/CRUD.git'
            }
        }

        stage('Build') {
            steps {
                echo "🔧 Building project with Maven..."
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                echo "🧪 Running tests..."
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                echo "🚀 Deploying the Spring Boot JAR..."
                sh '''
                JAR_FILE=$(ls target/*.jar | head -n 1)
                echo "Running $JAR_FILE..."
                nohup java -jar $JAR_FILE > app.log 2>&1 &
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Build and deployment successful!"
        }
        failure {
            echo "❌ Build failed. Please check logs."
        }
    }
}
