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
    stage('Run') {
      steps {
        sh 'docker run rm -f toolkit_running'
      }
      steps {
        sh 'docker run -d --name toolkit_running -u root -it toolkit'
      }
    }
  }
}