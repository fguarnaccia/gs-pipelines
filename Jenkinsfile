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
                powershell label: 'Create Standard folder', script: 'if (-not (Test-Path "Standard")) {New-Item -ItemType "directory" -Path "Standard"}'
                powershell label: 'Create Applications folder', script: 'if (-not (Test-Path "Standard\\Applications")) {New-Item -ItemType "directory" -Path "Standard\\Applications"}'
                powershell label: 'Create Apps folder', script: 'if (-not (Test-Path "Apps")) {New-Item -ItemType "directory" -Path "Apps"}'
                powershell label: 'Create BuildArtifacts folder', script: 'if (-not (Test-Path "buildartifatcs")) {New-Item -ItemType "directory" -Path "buildartifacts"}'

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
                      powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "Standard\${env.repofolder}"}'
                      dir ("Standard/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                 }  
               stage('Pull02') { 
                    environment { 
                        gitrepo = "tbw-server"
                        repofolder = "server"
                      }   
                    steps {
                        powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\${env.repofolder}"}'
                        dir ("Standard/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }     
               stage('Pull03') { 
                    environment { 
                        gitrepo = "tbw-client"
                        repofolder = "client"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\${env.repofolder}"}'
                       dir ("Standard/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
               stage('Pull04') {               
                    environment { 
                        gitrepo = "erp"
                        repofolder = "ERP"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\${env.repofolder}"}'
                       dir ("Standard/Applications/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
                stage('Pull05') {               
                    environment { 
                        gitrepo = "MDC"
                        repofolder = "MDC"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\${env.repofolder}"}'
                       dir ("Standard/Applications/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
 
                }
                stage('Pull06') {               
                    environment { 
                        gitrepo = "TBF"
                        repofolder = "TBF"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\${env.repofolder}"}'
                       dir ("Standard/Applications/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
                stage('Pull07') {               
                    environment { 
                        gitrepo = "micro-database-management"
                        repofolder = "micro-database-management"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\${env.repofolder}"}'
                       dir ("Standard/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
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
