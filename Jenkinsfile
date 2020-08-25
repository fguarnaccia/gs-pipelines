pipeline {
  environment {
  version = "1.2.0"
  suffix = "develop"
  branch = "develop"  
  tag = "${env.version}.${env.BUILD_ID}-${env.suffix}"
    }
  
    agent any 
    stages {
            stage('PrepareFolder') { 
            steps {
              
             // bat label: 'Remove server folder ', script: 'rd Standard\\server" /S /Q'
              //bat label: 'Remove erp folder ', script: 'rd Standard\\Applications\\ERP" /S /Q'
              
              bat label: 'Create server folder ', returnStatus: true, script: 'mkdir Standard\\server"'
              bat label: 'Create erp folder ', script: 'mkdir Standard\\Applications\\ERP"'
             
                }
            }
        stage('Pull') { 
            steps {
              //git branch: env.branch, credentialsId: 'git:996e1f714b08e971ec79e3bea686287e66441f043177999a13dbc546d8fe402a', url: 'https://github.com/fguarnaccia/gsmicrologger.git'
             // bat label: 'Create folder ', script: 'mkdir Standard\\server"'
             // bat label: 'Create folder ', script: 'mkdir Standard\\Applications\\ERP"'
              dir ('Standard/server') {
                git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/tbw-server.git' }
                }
                }
        stage('Pull2') { 
          
          environment { 
                branch = 'feature/ext-functions'
            }
            steps {

              dir ('Standard/Applications/ERP') {
                git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/erp.git' 
                 } 
        }
        }
        
      stage('Show') { 
            steps {
                  echo "Built ${env.tag}"
                  echo tag  
            }
        }
    }
}
