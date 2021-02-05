pipeline {
  agent any
  stages {
    stage('Example') {
      steps {
        echo "Hello"
      }
    }
    stage('Build') {
      environment {
        CI = 'true'
      }
      steps {
        sh 'docker build -t toolkit -f Dockerfile .'
      }
    }
}