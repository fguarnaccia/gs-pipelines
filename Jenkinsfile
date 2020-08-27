pipeline {
  environment   {
      version = "1.2.0"
      suffix = "develop"
      branch = "develop"  
      tag = "${env.version}.${env.BUILD_ID}-${env.suffix}"
      tagongit = 'true'
      commitmessage = "Jenkins tag on successfully build for ${env.tag} "  //git tag -a -m "Jenkins tag on successfully build for version $VERSION.$BUILDNUMB ($SUFFIX)" cloud/v$VERSION.$BUILDNUMB-$SUFFIX
    }
  
    agent any 
    stages {
          stage('PrepareFolders') { 
                steps {
                cleanWs deleteDirs: true
                powershell label: Create Standard folder', script: 'if (-not (Test-Path "Standard")) {New-Item -ItemType "directory" -Path "Standard"}'
                powershell label: 'Create Applications folder', script: 'if (-not (Test-Path "Standard\\Applications")) {New-Item -ItemType "directory" -Path "Standard\\Applications"}'
                powershell label: 'Create Apps folder', script: 'if (-not (Test-Path "Apps")) {New-Item -ItemType "directory" -Path "Apps"}'
                powershell label: 'Create BuildArtifacts folder', script: 'if (-not (Test-Path "buildartifatcs")) {New-Item -ItemType "directory" -Path "buildartifatcs"}'

                }
            }      
          stage('Pull da git') {
            parallel{
                stage('Pull01') {
                    environment { 
                      gitrepo = "tbw-taskBuilder"
                      repofolder = "Taskbuilder"
                      }             
                    steps {
                     powershell label: 'Create ${env.repofolder} folder', script: 'if (-not (Test-Path "Standard\\client")) {New-Item -ItemType "directory" -Path "Standard\\ ${env.repofolder}"}'
                     dir ("Standard/ ${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/ ${env.repofolder}.git" } }
                 }  
                stage('Pull02') { 
                    steps {
                        powershell label: 'Create server folder', script: 'if (-not (Test-Path "Standard\\server")) {New-Item -ItemType "directory" -Path "standard\\server"}'
                        dir ('Standard/server') { git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/tbw-server.git' } }
                }     
                stage('Pull03') { 
                    steps {
                     powershell label: 'Create client folder', script: 'if (-not (Test-Path "Standard\\client")) {New-Item -ItemType "directory" -Path "Standard\\client"}'
                     dir ('Standard/client') { git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/tbw-client.git' }  }
                }
                stage('Pull04') {               
                    steps {
                     powershell label: 'Create ERP folder', script: 'if (-not (Test-Path "Standard\\Applications\\ERP")) {New-Item -ItemType "directory" -Path "Standard\\Applications\\ERP"}'
                     dir ('Standard/Applications/ERP') { git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/erp.git' } }
                }
                stage('Pull05') {               
                    steps {
                     powershell label: 'Create MDC folder', script: 'if (-not (Test-Path "Standard\\Applications\\MDC")) {New-Item -ItemType "directory" -Path "Standard\\Applications\\MDC"}'
                     dir ('Standard/Applications/MDC') { git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/MDC.git' } }
                }
                stage('Pull06') {               
                    steps {
                     powershell label: 'Create TBF folder', script: 'if (-not (Test-Path "Standard\\Applications\\TBF")) {New-Item -ItemType "directory" -Path "Standard\\Applications\\TBF"}'
                     dir ('Standard/Applications/TBF') { git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/TBF.git' } }
                }
                stage('Pull07') {               
                    steps {
                     powershell label: 'Create micro-database-management folder', script: 'if (-not (Test-Path "Standard\\micro-database-management")) {New-Item -ItemType "directory" -Path "Standard\\micro-database-management"}'
                     dir ('Standard/micro-database-management') { git branch: env.branch, credentialsId: 'githubccnet', url: 'https://github.com/Microarea/micro-database-management.git' } }
                }


                 }
              }                
          stage('PostandTag') {
                when {
                  environment name: 'tagongit', value: 'true'
                }
                steps {
                      echo "Built ${env.tag}" 
                      echo "Msgm ${commitmessage}"
                }
            }
    }}
