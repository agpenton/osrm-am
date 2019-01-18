pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      agent any
      steps {
        git(url: 'https://github.com/agpenton/osrm-am.git', branch: 'master', changelog: true)
      }
    }
    stage('Building image') {
      steps {
        sh 'dockerImage = docker.build registry + ":$BUILD_NUMBER"'
      }
    }
    stage('Deploy Image') {
      steps {
        sh '''docker.withRegistry( \'\', registryCredential ) 


{


            dockerImage.push()
          }'''
      }
    }
    stage('Remove Unused docker image') {
      steps {
        sh 'sh "docker rmi $registry:$BUILD_NUMBER"'
      }
    }
  }
  environment {
    registry = 'agpenton/osrm-am"'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
}