pipeline {
  agent { node { label 'master' } }

  stages {
      stage(test) {
          steps {
              script {
                  ifconfig
              }
          }
      }
  }