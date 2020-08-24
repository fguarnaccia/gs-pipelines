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
              //git branch: env.branch, credentialsId: 'git:996e1f714b08e971ec79e3bea686287e66441f043177999a13dbc546d8fe402a', url: 'https://github.com/fguarnaccia/gsmicrologger.git'
              bat label: 'Create folder ', script: 'mkdir Standard\\server"'
              bat label: 'Create folder ', script: 'mkdir Standard\\Applications\\ERP"'
              dir ('Standard/server') {
                git branch: env.branch, credentialsId: 'githubccnet', url: 'https://9f55c6ff55ec8e7e1da54cf7a5819346f1d968b2@github.com/Microarea/tbw-server.git' }
                }
              dir ('Standard/Applications/ERP') {
            g     it branch: env.branch, credentialsId: 'githubccnet', url: 'https://9f55c6ff55ec8e7e1da54cf7a5819346f1d968b2@github.com/Microarea/erp.git' 
          } 
        }
      stage('Show') { 
            steps {
                  echo suffix
                  echo env.branch
            }
        }
    }
}
