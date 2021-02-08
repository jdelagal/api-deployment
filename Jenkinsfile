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
        sh 'docker rm -f toolkit_running'
        sh 'docker run -d --name toolkit_running -u root -it toolkit'
      }
    }
    stage('Check Deployment') {
      steps {
        sh 'docker exec -i toolkit_running bash -c ./script.sh' 
      }
    }
  }
}