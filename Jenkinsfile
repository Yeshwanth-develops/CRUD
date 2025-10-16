pipeline {
    agent any

    tools {
        maven 'Maven_3.9'  // Ensure this name matches Jenkins tool config
        jdk 'Java_17'      // Ensure this name matches Jenkins tool config
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
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                echo "🧪 Running tests..."
                bat 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                echo "🚀 Starting the Spring Boot application..."
                bat 'start java -jar target\\*.jar'
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
