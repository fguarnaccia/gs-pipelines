pipeline {
  environment   {
      version = "1.2.0"
      suffix = "devnewpipe"
      branch = "develop"  
      tag = "${env.version}.${env.BUILD_ID}-${env.suffix}"
      internationalstudiopath = "C:\\Program Files (x86)\\Microarea\\InternationalStudio\\InternationalStudio.exe"
      msbuildpath = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Professional\\MSBuild\\Current\\Bin\\msbuild.exe"
      nugetpath = "${env.WORKSPACE}\\Standard\\Taskbuilder\\OtherComponents\\Nuget\\nuget.exe"
      config = 'Release'
      platform = 'x64'
      buildtype = "rebuild"
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
               stage('Pull tbw-client') { 
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
                       dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "https://github.com/Microarea/${env.gitrepo}.git" } }
                }				
		stage('Pull MyMagoStudio') {               
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

          stage('Build Dictionaries') {
            parallel{
                stage('Dict TaskBuilderWeb') {
                    environment { 
                        gitrepo = "tbw-taskBuilder"
                        repofolder = "Standard\\Taskbuilder"
                      }             
                    steps {                    
                        bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.repofolder}\\TaskBuilderWeb.tblsln"""
                        }
                 }
                stage('Dict erp') {
                    environment { 
                        gitrepo = "erp"
                        repofolder = "Standard\\Applications\\erp"
                      }             
                    steps {                    
                            bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.repofolder}\\${env.gitrepo}.tblsln"""
                          }
                 } 				 
                stage('Dict server') {
                    environment { 
                        gitrepo = "tbw-server"
                        repofolder = "Standard\\server"
                      }             
                    steps {                    
                        bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.repofolder}\\server.tblsln"""
                        }
                }    
                stage('Dict client') {
                    environment { 
                        gitrepo = "tbw-client"
                        repofolder = "Standard\\client"
                      }             
                    steps {                    
                        bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.repofolder}\\client.tblsln"""
                       }
                 }    
                stage('Dict MDC') {
                    environment { 
                        gitrepo = "MDC"
                        repofolder = "Standard\\Applications\\MDC"
                      }             
                    steps {                    
                        //dir ("${env.repofolder}") { bat """"${env.internationalstudiopath}" "${env.gitrepo}".tblsln"""  }
                        bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.repofolder}\\${env.gitrepo}.tblsln""" 
                        }
                 } 
                stage('Dict Retail') {
                    environment { 
                        gitrepo = "Retail"
                        repofolder = "Standard\\Applications\\Retail"
                      }             
                    steps {                    
                        bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.repofolder}\\${env.gitrepo}.tblsln"""
                       }
                 } 
                stage('Dict WMS') {
                    environment { 
                        gitrepo = "WMS"
                        repofolder = "Standard\\Applications\\WMS"
                      }             
                    steps {                    
                          bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.repofolder}\\${env.gitrepo}.tblsln"""
                       }
                 } 
                stage('Dict WMSRetail') {
                    environment { 
                        gitrepo = "WMSRetail"
                        repofolder = "Standard\\Applications\\WMSRetail"
                      }             
                    steps {                    
                         bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.repofolder}\\${env.gitrepo}.tblsln"""
                       }
                 } 				
				//le due parentesi che seguono chiudono lo stage parallel
                 }
              }
          stage('Build C++ Repos') {
            stages{
                stage('Build Taskbuilder') {
                    environment { 
                        gitrepo = "tbw-taskBuilder"
                        repofolder = "Standard\\Taskbuilder"		    			
                      }             
                    steps {     
                      dir ("${env.repofolder}") {
                                bat ".\\OtherComponents\\Nuget\\nuget.exe restore taskbuilder.sln"
                                bat """\"${msbuildpath}\"  taskbuilder.sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
                              }
			              }			  
					      }
			
                stage('Build erp') {
                    environment { 
                        gitrepo = "erp"
                        repofolder = "Standard\\Applications\\erp"		    			
                      }             
                    steps {     
                      dir ("${env.repofolder}") {
                                bat "${env.nugetpath} restore ${env.gitrepo}.sln"
                                bat """\"${msbuildpath}\"  "${env.gitrepo}".sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
                              }
			              }			  
					      }
                stage('Build mdc') {
                    environment { 
                        gitrepo = "mdc"
                        repofolder = "Standard\\Applications\\mdc"		    			
                      }             
                    steps {     
                      dir ("${env.repofolder}") {
                                bat "${env.nugetpath} restore ${env.gitrepo}.sln"
                                bat """\"${msbuildpath}\"  "${env.gitrepo}".sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
                              }
			              }			  
					      }

                stage('Build wms') {
                    environment { 
                        gitrepo = "wms"
                        repofolder = "Standard\\Applications\\wms"		    			
                      }             
                    steps {     
                      dir ("${env.repofolder}") {
                                bat "${env.nugetpath} restore ${env.gitrepo}.sln"
                                bat """\"${msbuildpath}\"  "${env.gitrepo}".sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
                              }
			              }			  
					      }

                stage('Build retail') {
                    environment { 
                        gitrepo = "retail"
                        repofolder = "Standard\\Applications\\retail"		    			
                      }             
                    steps {     
                      dir ("${env.repofolder}") {
                                bat "${env.nugetpath} restore ${env.gitrepo}.sln"
                                bat """\"${msbuildpath}\"  "${env.gitrepo}".sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
                              }
			              }			  
					      }
                stage('Build wmsretail') {
                    environment { 
                        gitrepo = "wmsretail"
                        repofolder = "Standard\\Applications\\wmsretail"		    			
                      }             
                    steps {     
                      dir ("${env.repofolder}") {
                                bat "${env.nugetpath} restore ${env.gitrepo}.sln"
                                bat """\"${msbuildpath}\"  "${env.gitrepo}".sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
                              }
			              }			  
					      }

				//le due parentesi che seguono chiudono lo stage sequential (stages)
                 }
              }


          stage('Publish .NetCore Services') {
            parallel{
                stage('Publish account-manager') {
                    environment { 
                        svcname = "account-manager"
                        svcfolder = "standard\\server"		 
                        outputfolder = "standard\\Taskbuilder\\WebFramework\\${env.svcname}"	   			
                      }             
                    steps {     
                            dir ("${env.WORKSPACE}\\${env.svcfolder}\\${env.svcname}") {bat "del web.config"}
                            bat "dotnet publish --framework netcoreapp3.1 ${env.WORKSPACE}\\${env.svcfolder}\\${env.svcname}\\ -c release -o  ${env.WORKSPACE}\\${env.outputfolder} -p:Version=${env.version}.${env.BUILD_ID},AssemblyVersion=${env.version}.${env.BUILD_ID}"
			              //da provare in un prossimo passo -r linux-x64 -p:Version=1.2.0.64,AssemblyVersion=1.2.0.64  --no-self-contained
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