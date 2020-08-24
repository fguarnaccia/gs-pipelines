pipeline {
  environment {
  version = "1.2.0"
  suffix = "develop"
  }
  
    agent any 
    stages {
        stage('Pull') { 
            steps {
                  git 'https://github.com/fguarnaccia/gsmicrologger.git' 
                  echo suffixz
            }
        }

    }
}
