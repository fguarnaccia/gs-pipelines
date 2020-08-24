pipeline {
  environment {
  version = "1.2.0"
  suffix = "develop"
  branch = "develop"  
  }
  
    agent any 
    stages {
        stage('Pull') { 
            steps {
                 git branch: 'develop', credentialsId: 'git:996e1f714b08e971ec79e3bea686287e66441f043177999a13dbc546d8fe402a', url: 'https://github.com/fguarnaccia/gsmicrologger.git'
            }
        }
      stage('Show') { 
            steps {
                  echo version'-'suffix
            }
        }
    }
}
