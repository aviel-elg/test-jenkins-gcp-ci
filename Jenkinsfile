pipeline {
  agent any
  options {
    skipDefaultCheckout(true)
  }
  stages{
    stage('clean workspace') {
      steps {
        cleanWs()
      }
    }
    stage('checkout') {
      steps {
        checkout scm
      }
    }
    stage('tf init') {
      steps {
        withCredentials([
          file(credentialsId: 'gcloud-secret-file', variable: 'GOOGLE_APPLICATION_CREDENTIALS')
        ]) {
          sh '/opt/homebrew/bin/terraform init'
        }
      }
    }
    stage('tf apply') {
      steps {
        withCredentials([ 
          file(credentialsId: 'gcloud-secret-file', variable: 'GOOGLE_APPLICATION_CREDENTIALS'),
          file(credentialsId: 'gcloud-secret-file', variable: 'GCLOUD_CREDS')
          ]) {
          sh '/opt/homebrew/bin/terraform apply -auto-approve -no-color -var="creds_path=$GCLOUD_CREDS"'
        }
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}