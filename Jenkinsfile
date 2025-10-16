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
