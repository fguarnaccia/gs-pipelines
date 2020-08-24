pipeline {
  environment {
  version = "1.2.0"
  suffix = "develop"
  }
  
    agent any 
    stages {
        stage('Pull') { 
            steps {
                  git config --global user.name "fguarnaccia"
                  git config --global user.email "CCNET@microarea.it"
                  git 'https://github.com/fguarnaccia/gsmicrologger.git'  checkout develop

            }
        }
      stage('Show') { 
            steps {
                  echo suffix
            }
        }
    }
}
