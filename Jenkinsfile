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
    stage('test') {
      steps {
        withCredentials([file(credentialsId: 'gcloud-secret-file', variable: 'GCLOUD_CREDS')]) {
          sh './terraformw apply -auto-approve -no-color -var="creds_path=$GCLOUD_CREDS"'
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