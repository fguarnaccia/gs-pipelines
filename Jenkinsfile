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
              cleanWs deleteDirs: true
              //bat label: 'Create server folder ', returnStatus: true, script: 'mkdir Standard\\server"'
              powershell label: 'Create server folder', script: 'if (-not (Test-Path "standard\\server")) {New-Item -ItemType "directory" -Path "standard\\server"}'
              powershell label: 'Create Erp folder', script: 'if (-not (Test-Path "Standard\\Applications\\ERP")) {New-Item -ItemType "directory" -Path "Standard\\Applications\\ERP"}'
              powershell label: 'Create Apps  folder', script: 'if (-not (Test-Path "Apps")) {New-Item -ItemType "directory" -Path "Apps"}'
              powershell label: 'Create Apps  folder', script: 'if (-not (Test-Path "Apps")) {New-Item -ItemType "directory" -Path "Apps"}'       
                }
            }
        stage('PullUno) { 
            steps {
              dir ('Standard/server') {
                git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/tbw-server.git' }
                }
                }
        stage('PullDue') { 
          
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
