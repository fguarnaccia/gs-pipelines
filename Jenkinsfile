pipeline {
  environment   {
      version = "1.2.0"
      suffix = "develop"
      branch = "develop"  
      tag = "${env.version}.${env.BUILD_ID}-${env.suffix}"
	  internationalstudiopath ="C:\Program Files (x86)\Microarea\InternationalStudio\InternationalStudio.exe"
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
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\Applications\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\Applications\${env.repofolder}"}'
                       dir ("Standard/Applications/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
                stage('Pull05') {               
                    environment { 
                        gitrepo = "MDC"
                        repofolder = "MDC"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\Applications\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\Applications\${env.repofolder}"}'
                       dir ("Standard/Applications/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
 
                }
                stage('Pull06') {               
                    environment { 
                        gitrepo = "TBF"
                        repofolder = "TBF"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\Applications\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\Applications\${env.repofolder}"}'
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
                stage('Pull08') {               
                    environment { 
                        gitrepo = "M4_dashboard"
                        repofolder = "M4_dashboard"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\Applications\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\Applications\${env.repofolder}"}'
                       dir ("Standard//Applications/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
				stage('Pull09') {               
                    environment { 
                        gitrepo = "Retail"
                        repofolder = "Retail"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\Applications\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\Applications\${env.repofolder}"}'
                       dir ("Standard//Applications/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
				stage('Pull10') {               
                    environment { 
                        gitrepo = "WMS"
                        repofolder = "WMS"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\Applications\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\Applications\${env.repofolder}"}'
                       dir ("Standard//Applications/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }	
				stage('Pull11') {               
                    environment { 
                        gitrepo = "WMSRetail"
                        repofolder = "WMSRetail"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\Applications\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\Applications\${env.repofolder}"}'
                       dir ("Standard//Applications/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }				
				stage('Pull12') {               
                    environment { 
                        gitrepo = "MyMagoStudio"
                        repofolder = "MyMagoStudio"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\Applications\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\Applications\${env.repofolder}"}'
                       dir ("Standard//Applications/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
				stage('Pull13') {               
                    environment { 
                        gitrepo = "DBCreationDlls-sqlserver"
                        repofolder = "DBCreationDlls-sqlserver"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\${env.repofolder}"}'
                       dir ("Standard/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
				stage('Pull14') {               
                    environment { 
                        gitrepo = "DBCreationDlls-postgres"
                        repofolder = "DBCreationDlls-postgres"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\${env.repofolder}"}'
                       dir ("Standard/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
				stage('Pull15') {               
                    environment { 
                        gitrepo = "erp-model"
                        repofolder = "erp-model"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\${env.repofolder}"}'
                       dir ("Standard/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
				stage('Pull16') {               
                    environment { 
                        gitrepo = "erp-services"
                        repofolder = "erp-services"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\Applications\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\Applications\${env.repofolder}"}'
                       dir ("Standard//Applications/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }				
				stage('Pull17') {               
                    environment { 
                        gitrepo = "Tbf-tools"
                        repofolder = "Tbf-tools"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\${env.repofolder}"}'
                       dir ("Standard/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }				
				stage('Pull18') {               
                    environment { 
                        gitrepo = "Tbf-library"
                        repofolder = "Tbf-library"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "Standard\\${env.repofolder}")) {New-Item -ItemType "directory" -Path "standard\${env.repofolder}"}'
                       dir ("Standard/${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
				
				//le due parentesi che seguono chiudono lo stage parallel
                 }
              }    

          stage('Build Dictionary') {
            parallel{
                stage('Dict-01') {
                    environment { 
                        gitrepo = "tbw-taskBuilder"
                        repofolder = "Taskbuilder"
                      }             
                    steps {                    
                      dir ("Standard/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '${env.internationalstudiopath} TaskBuilderWeb.tblsln'} }
                 }
                stage('Dict-02') {
                    environment { 
                        gitrepo = "erp"
                        repofolder = "erp"
                      }             
                    steps {                    
                      dir ("Standard/Applications/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '${env.internationalstudiopath} "${env.gitrepo.tblsln"'} }
                 } 				 
                stage('Dict-03') {
                    environment { 
                        gitrepo = "tbw-server"
                        repofolder = "server"
                      }             
                    steps {                    
                      dir ("Standard/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '${env.internationalstudiopath} server.tblsln'} }
                 }    
                stage('Dict-04') {
                    environment { 
                        gitrepo = "tbw-client"
                        repofolder = "server"
                      }             
                    steps {                    
                      dir ("Standard/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '${env.internationalstudiopath} client.tblsln'} }
                 }    
                stage('Dict-05') {
                    environment { 
                        gitrepo = "MDC"
                        repofolder = "MDC"
                      }             
                    steps {                    
                      dir ("Standard/Applications/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '${env.internationalstudiopath} "${env.gitrepo.tblsln"'} }
                 } 
                stage('Dict-06') {
                    environment { 
                        gitrepo = "Retail"
                        repofolder = "Retail"
                      }             
                    steps {                    
                      dir ("Standard/Applications/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '${env.internationalstudiopath} "${env.gitrepo.tblsln"'} }
                 } 
                stage('Dict-07') {
                    environment { 
                        gitrepo = "WMS"
                        repofolder = "WMS"
                      }             
                    steps {                    
                      dir ("Standard/Applications/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '${env.internationalstudiopath} "${env.gitrepo.tblsln"'} }
                 } 
                stage('Dict-08') {
                    environment { 
                        gitrepo = "WMSRetail"
                        repofolder = "WMSRetail"
                      }             
                    steps {                    
                      dir ("Standard/Applications/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '${env.internationalstudiopath} "${env.gitrepo.tblsln"'} }
                 } 				
				//le due parentesi che seguono chiudono lo stage parallel
                 }
              }
          stage('Build C++ Repos) {
            parallel{
                stage('Build-01') {
                    environment { 
                        gitrepo = "tbw-taskBuilder"
                        repofolder = "Taskbuilder"
                      }             
                    steps {     
		      	  bat "Standard\TaskBuilder\OtherComponents\Nuget\nuget.exe restore Standard\${env.repofolder}\${env.repofolder}.sln"
			   script{					
				bat "\"${tool 'VisualStudio 2019'}\msbuild\" "Standard\${env.repofolder}\${env.repofolder}.sln" -t:rebuild -p:Configuration=Release -p:Platform=\"x64\"
			   }			  
					  
                 }
			
				//le due parentesi che seguono chiudono lo stage parallel
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
