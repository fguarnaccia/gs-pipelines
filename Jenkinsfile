pipeline {
  environment {
  version = "1.2.0"
  suffix = "develop"
  }
  
    agent any 
    stages {
        stage('Pull') { 
            steps {
                  bat git config --global user.name "fguarnaccia"
                  bat git config --global user.email "CCNET@microarea.it"
                  bat git 'https://github.com/fguarnaccia/gsmicrologger.git'  checkout develop

            }
        }
      stage('Show') { 
            steps {
                  echo suffix
            }
        }
    }
}
