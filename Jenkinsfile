pipeline {
  environment   {
      version = "1.2.0"
      suffix = "develop"
      branch = "develop"  
      tag = "${env.version}.${env.BUILD_ID}-${env.suffix}"
      internationalstudiopath = "C:\\Program Files (x86)\\Microarea\\InternationalStudio\\InternationalStudio.exe"
      msbuildpath = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Professional\\MSBuild\\Current\\Bin\\msbuild.exe"
      CONFIG = 'Release'
      PLATFORM = 'x64'
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
                stage('Pull tbw-taskBuilder') {
                    environment { 
                        gitrepo = "tbw-taskBuilder"
                        repofolder = "Standard\\Taskbuilder"
                      }             
                    steps {
                      powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                      dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                 }  
               stage('Pull tbw-server') { 
                    environment { 
                        gitrepo = "tbw-server"
                        repofolder = "Standard\\server"
                      }   
                    steps {
                        powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                        dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }     
               stage('Pulltbw-client') { 
                    environment { 
                        gitrepo = "tbw-client"
                        repofolder = "Standard\\client"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
               stage('Pull ERP') {               
                    environment { 
                        gitrepo = "erp"
                        repofolder = "Standard\\Applications\\ERP"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
                stage('Pull MDC') {               
                    environment { 
                        gitrepo = "MDC"
                        repofolder = "Standard\\Applications\\MDC"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
 
                }
                stage('Pull TBF') {               
                    environment { 
                        gitrepo = "TBF"
                        repofolder = "Standard\\Applications\\TBF"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
                stage('Pull mdm') {               
                    environment { 
                        gitrepo = "micro-database-management"
                        repofolder = "Standard\\micro-database-management"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
                stage('Pull M4_dashboard') {               
                    environment { 
                        gitrepo = "M4_dashboard"
                        repofolder = "Standard\\Applications\\M4_dashboard"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
		stage('Pull Retail') {               
                    environment { 
                        gitrepo = "Retail"
                        repofolder = "Standard\\Applications\\Retail"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
		stage('Pull WMS') {               
                    environment { 
                        gitrepo = "WMS"
                        repofolder = "Standard\\Applications\\WMS"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }	
		stage('Pull WMSRetail') {               
                    environment { 
                        gitrepo = "WMSRetail"
                        repofolder = "Standard\\Applications\\WMSRetail"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("{env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }				
		tage('Pull MyMagoStudio') {               
                    environment { 
                        gitrepo = "MyMagoStudio"
                        repofolder = "Standard\\Applications\\MyMagoStudio"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
		stage('Pull DBCreationDlls-sqlserver') {               
                    environment { 
                        gitrepo = "DBCreationDlls-sqlserver"
                        repofolder = "Standard\\DBCreationDlls-sqlserver"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
		stage('Pull DBCreationDlls-postgres') {               
                    environment { 
                        gitrepo = "DBCreationDlls-postgres"
                        repofolder = "Standard\\DBCreationDlls-postgres"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
		stage('Pull erp-model') {               
                    environment { 
                        gitrepo = "erp-model"
                        repofolder = "Standard\\erp-model"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }
		stage('Pull erp-services') {               
                    environment { 
                        gitrepo = "erp-services"
                        repofolder = "Standard\\Applications\\erp-services"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }				
		stage('Pull Tbf-tools') {               
                    environment { 
                        gitrepo = "Tbf-tools"
                        repofolder = "Standard\\Tbf-tools"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }				
		stage('Pull Tbf-library') {               
                    environment { 
                        gitrepo = "Tbf-library"
                        repofolder = "Standard\\Tbf-library"
                      }   
                    steps {
                       powershell label: "Create ${env.repofolder} folder and pull ${env.gitrepo}", script: 'if (-not (Test-Path "${env.repofolder}")) {New-Item -ItemType "directory" -Path "${env.repofolder}"}'
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
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
                      dir ("Standard/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '"${env.internationalstudiopath}" TaskBuilderWeb.tblsln'} }
                 }
                stage('Dict-02') {
                    environment { 
                        gitrepo = "erp"
                        repofolder = "erp"
                      }             
                    steps {                    
                      dir ("Standard/Applications/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '"${env.internationalstudiopath}" "${env.gitrepo.tblsln"'} }
                 } 				 
                stage('Dict-03') {
                    environment { 
                        gitrepo = "tbw-server"
                        repofolder = "server"
                      }             
                    steps {                    
                      dir ("Standard/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '"${env.internationalstudiopath}" server.tblsln'} }
                 }    
                stage('Dict-04') {
                    environment { 
                        gitrepo = "tbw-client"
                        repofolder = "server"
                      }             
                    steps {                    
                      dir ("Standard/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '"${env.internationalstudiopath}" client.tblsln'} }
                 }    
                stage('Dict-05') {
                    environment { 
                        gitrepo = "MDC"
                        repofolder = "MDC"
                      }             
                    steps {                    
                      dir ("Standard/Applications/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '"${env.internationalstudiopath}" "${env.gitrepo.tblsln"'} }
                 } 
                stage('Dict-06') {
                    environment { 
                        gitrepo = "Retail"
                        repofolder = "Retail"
                      }             
                    steps {                    
                      dir ("Standard/Applications/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '"${env.internationalstudiopath}" "${env.gitrepo.tblsln"'} }
                 } 
                stage('Dict-07') {
                    environment { 
                        gitrepo = "WMS"
                        repofolder = "WMS"
                      }             
                    steps {                    
                      dir ("Standard/Applications/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '"${env.internationalstudiopath}" "${env.gitrepo.tblsln"'} }
                 } 
                stage('Dict-08') {
                    environment { 
                        gitrepo = "WMSRetail"
                        repofolder = "WMSRetail"
                      }             
                    steps {                    
                      dir ("Standard/Applications/${env.repofolder}") {powershell label: "Build dictionary for ${env.gitrepo}.git", script: '"${env.internationalstudiopath}" "${env.gitrepo.tblsln"'} }
                 } 				
				//le due parentesi che seguono chiudono lo stage parallel
                 }
              }
          stage('Build C++ Repos') {
            parallel{
                stage('Build Taskbuilder') {
                    environment { 
                        gitrepo = "tbw-taskBuilder"
                        repofolder = "Standard\\Taskbuilder"
			
    			
                      }             
                    steps {     
		      	 dir ("${env.repofolder}") {bat ".\\OtherComponents\\Nuget\\nuget.exe restore taskbuilder.sln"
						   bat """\"${msbuildpath}\"  taskbuilder.sln -t:rebuild -p:Configuration=${env.CONFIG} -p:Platform=${env.PLATFORM}"""
						   }
			   				
				//bat "\"${tool 'VisualStudio 2019'}\msbuild\" "Standard\${env.repofolder}\${env.repofolder}.sln" -t:rebuild -p:Configuration=Release -p:Platform=\"x64\"
			       
			       

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
