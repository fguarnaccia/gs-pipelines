pipeline {
  environment {
  version = "1.2.0"
  suffix = "developextfunc"
  branch = "feat/developextfunc"  
    }
  
    agent any 
    stages {
            stage('PrepareFolder') { 
            steps {
              
              bat label: 'Create server folder ', script: 'mkdir Standard\\server"'
              bat label: 'Create erp folder ', script: 'mkdir Standard\\Applications\\ERP"'
             
                }
            }
        stage('Pull') { 
            steps {
              dir ('Standard/server') {
                git branch: env.branch, credentialsId: 'githubccnet', url: 'https://9f55c6ff55ec8e7e1da54cf7a5819346f1d968b2@github.com/Microarea/tbw-server.git' }
                }
                }
        stage('Pull2') { 
            steps {

              dir ('Standard/Applications/ERP') {
                git branch: env.branch, credentialsId: 'githubccnet', url: 'https://9f55c6ff55ec8e7e1da54cf7a5819346f1d968b2@github.com/Microarea/erp.git' 
                 } 
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
