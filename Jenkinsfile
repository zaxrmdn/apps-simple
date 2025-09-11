pipeline {
    agent {label 'devops1-zakaria'}

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/zaxrmdn/apps-simple.git'
            }
        }
        stage('Build') {
            steps {
                sh '''cd apps
                npm install'''
            }
        }
        stage('Testing') {
            steps {
                sh '''cd apps
                npm test
                npm run test:coverage'''
            }
        }
        stage('Code Review') {
            steps {
                sh '''cd apps
                sonar-scanner \
                -Dsonar.projectKey=simple-apps \
                -Dsonar.sources=. \
                -Dsonar.host.url=http://172.23.13.204:9000 \
                -Dsonar.login=sqp_562e9fd4f3f680d360483f2aef6b13c294152283'''
            }
        }
        stage('Deploy compose') {
            steps {
                sh '''
                docker compose build
                docker compose up -d
                '''
            }
        }
    }
}