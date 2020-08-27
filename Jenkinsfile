pipeline {
  environment   {
      version = "1.2.0"
      suffix = "develop"
      branch = "develop"  
      tag = "${env.version}.${env.BUILD_ID}-${env.suffix}"
    }
  
    agent any 
    stages {
          stage('PrepareFolders') { 
                steps {
                cleanWs deleteDirs: true
                powershell label: 'Create Standard folder', script: 'if (-not (Test-Path "Standard")) {New-Item -ItemType "directory" -Path "Standard"}'
                powershell label: 'Create Applications folder', script: 'if (-not (Test-Path "Standard\\Applications")) {New-Item -ItemType "directory" -Path "Standard\\Applications"}'
                powershell label: 'Create Apps folder', script: 'if (-not (Test-Path "Apps")) {New-Item -ItemType "directory" -Path "Apps"}'
                }
            }      
          stage('Pull da git') {
            parallel{
                stage('Pull01') { 
                     agent {
                        label "spp-m4c-002"
                    }
                    steps {
                        powershell label: 'Create server folder', script: 'if (-not (Test-Path "Standard\\server")) {New-Item -ItemType "directory" -Path "standard\\server"}'
                        dir ('Standard/server') { git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/tbw-server.git' }
                        }
                }        
                stage('Pull02') {               
                    steps {
                     powershell label: 'Create ERP folder', script: 'if (-not (Test-Path "Standard\\Applications\\ERP")) {New-Item -ItemType "directory" -Path "Standard\\Applications\\ERP"}'
                     dir ('Standard/Applications/ERP') { git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/erp.git' } 
                    }
                }
                stage('Pull03') {             
                    steps {
                     powershell label: 'Create TaskBuilder folder', script: 'if (-not (Test-Path "Standard\\client")) {New-Item -ItemType "directory" -Path "Standard\\TaskBuilder"}'
                     dir ('Standard/TaskBuilder') { git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/tbw-TaskBuilder.git' } 
                    }
                 }           
                stage('Pull04') { 
                    steps {
                     powershell label: 'Create client folder', script: 'if (-not (Test-Path "Standard\\client")) {New-Item -ItemType "directory" -Path "Standard\\client"}'
                     dir ('Standard/client') { git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/tbw-client.git' }  }
                     }
                 }
              }                
          stage('PostandTag') { 
                steps {
                      echo "Built ${env.tag}" 
                }
            }
    }}
