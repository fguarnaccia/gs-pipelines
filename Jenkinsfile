pipeline {
  environment   {
      version = "1.2.0"
      suffix = "devnewpipe"
      branch = "develop"  
      tag = "${env.version}.${env.BUILD_ID}-${env.suffix}"
      internationalstudiopath = "C:\\Program Files (x86)\\Microarea\\InternationalStudio\\InternationalStudio.exe"
      msbuildpath = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Professional\\MSBuild\\Current\\Bin\\msbuild.exe"
      nugetpath = "${env.WORKSPACE}\\Standard\\Taskbuilder\\OtherComponents\\Nuget\\nuget.exe"
      dcbpath = "${env.JENKINS_HOME}\\tools\\dcb.dll"
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
                powershell label: 'Create BuildArtifacts folder', script: 'if (-not (Test-Path "buildartifacts")) {New-Item -ItemType "directory" -Path "buildartifacts"}'

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

          stage('Dictionaries') {
            parallel{
                stage('Build TaskBuilderWeb') {
                    environment { 
                        prjname = "TaskBuilderWeb"
                        prjfolder = "Standard\\Taskbuilder"
                      }             
                    steps {                    
                        bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.prjfolder}\\\${env.prjname}.tblsln"""
                        }
                 }
                stage('Build erp') {
                    environment { 
                        prjname = "erp"
                        prjfolder = "Standard\\Applications\\erp"
                      }             
                    steps {                    
                            bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.prjfolder}\\${env.prjname}.tblsln"""
                          }
                 } 				 
                stage('Build server') {
                    environment { 
                        prjname = "server"
                        prjfolder = "Standard\\server"
                      }             
                    steps {                    
                        bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.prjfolder}\\\${env.prjname}.tblsln"""
                        }
                }    
                stage('Build client') {
                    environment { 
                        prjname = "client"
                        prjfolder = "Standard\\client"
                      }             
                    steps {                    
                        bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.prjfolder}\\\${env.prjname}.tblsln"""
                       }
                 }    
                stage('Build MDC') {
                    environment { 
                        prjname = "MDC"
                        prjfolder = "Standard\\Applications\\MDC"
                      }             
                    steps {                    
                        //dir ("${env.repofolder}") { bat """"${env.internationalstudiopath}" "${env.gitrepo}".tblsln"""  }
                        bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.prjfolder}\\${env.prjname}.tblsln""" 
                        }
                 } 
                stage('Build Retail') {
                    environment { 
                        prjname = "Retail"
                        prjfolder = "Standard\\Applications\\Retail"
                      }             
                    steps {                    
                        bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.prjfolder}\\${env.prjname}.tblsln"""
                       }
                 } 
                stage('Build WMS') {
                    environment { 
                        prjname = "WMS"
                        prjfolder = "Standard\\Applications\\WMS"
                      }             
                    steps {                    
                          bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.prjfolder}\\${env.prjname}.tblsln"""
                       }
                 } 
                stage('Build WMSRetail') {
                    environment { 
                        prjname = "WMSRetail"
                        prjfolder = "Standard\\Applications\\WMSRetail"
                      }             
                    steps {                    
                         bat """"${env.internationalstudiopath}" "${env.WORKSPACE}\\${env.prjfolder}\\${env.prjname}.tblsln"""
                       }
                 } 				
				//le due parentesi che seguono chiudono lo stage parallel
                 }
              }
          stage('Build C++ Solutions') {
            stages{
                stage('Build Taskbuilder') {
                    environment { 
                        slnname = "taskbuilder"
                        slnfolder = "Standard\\Taskbuilder"		    			
                      }             
                    steps {     
                      dir ("${env.slnfolder}") {
                                bat ".\\OtherComponents\\Nuget\\nuget.exe restore ${env.slnname}.sln"
                                bat """\"${msbuildpath}\"  ${env.slnname}.sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
                              }
			              }			  
					      }
			
                stage('Build erp') {
                    environment { 
                        slnname = "erp"
                        slnfolder = "Standard\\Applications\\erp"		    			
                      }             
                    steps {     
                      dir ("${env.slnfolder}") {
                                bat "${env.nugetpath} restore ${env.slnname}.sln"
                                bat """\"${msbuildpath}\"  "${env.slnname}".sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
                              }
			              }			  
					      }
                stage('Build mdc') {
                    environment { 
                        slnname = "mdc"
                        slnfolder = "Standard\\Applications\\mdc"		    			
                      }             
                    steps {     
                      dir ("${env.slnfolder}") {
                                bat "${env.nugetpath} restore ${env.slnname}.sln"
                                bat """\"${msbuildpath}\"  "${env.slnname}".sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
                              }
			              }			  
					      }

                stage('Build wms') {
                    environment { 
                        slnname = "wms"
                        slnfolder = "Standard\\Applications\\wms"		    			
                      }             
                    steps {     
                      dir ("${env.slnfolder}") {
                                bat "${env.nugetpath} restore ${env.slnname}.sln"
                                bat """\"${msbuildpath}\"  "${env.slnname}".sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
                              }
			              }			  
					      }

                stage('Build retail') {
                    environment { 
                        slnname = "retail"
                        slnfolder = "Standard\\Applications\\retail"		    			
                      }             
                    steps {     
                      dir ("${env.slnfolder}") {
                                bat "${env.nugetpath} restore ${env.slnname}.sln"
                                bat """\"${msbuildpath}\"  "${env.slnname}".sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
                              }
			              }			  
					      }
                stage('Build wmsretail') {
                    environment { 
                        slnname = "wmsretail"
                        slnfolder = "Standard\\Applications\\wmsretail"		    			
                      }             
                    steps {     
                      dir ("${env.slnfolder}") {
                                bat "${env.nugetpath} restore ${env.slnname}.sln"
                                bat """\"${msbuildpath}\"  "${env.slnname}".sln -t:${env.buildtype} -p:Configuration=${env.config} -p:Platform=${env.platform}"""
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
                            bat "dotnet publish --framework netcoreapp3.1 ${env.WORKSPACE}\\${env.svcfolder}\\${env.svcname}\\${env.svcname}.csproj -c release -o  ${env.WORKSPACE}\\${env.outputfolder} -p:Version=${env.version}.${env.BUILD_ID},AssemblyVersion=${env.version}.${env.BUILD_ID}"
			              //da provare in un prossimo passo -r linux-x64 -p:Version=1.2.0.64,AssemblyVersion=1.2.0.64  --no-self-contained
                    }			  
					      }

                stage('Publish menu-service') {
                    environment { 
                        svcname = "menu-service"
                        svcfolder = "standard\\server"		 
                        outputfolder = "standard\\Taskbuilder\\WebFramework\\${env.svcname}"	   			
                      }             
                    steps {     
                            dir ("${env.WORKSPACE}\\${env.svcfolder}\\${env.svcname}") {bat "del web.config"}
                            bat "dotnet publish --framework netcoreapp3.1 ${env.WORKSPACE}\\${env.svcfolder}\\${env.svcname}\\${env.svcname}.csproj -c release -o  ${env.WORKSPACE}\\${env.outputfolder} -p:Version=${env.version}.${env.BUILD_ID},AssemblyVersion=${env.version}.${env.BUILD_ID}"
			              //da provare in un prossimo passo -r linux-x64 -p:Version=1.2.0.64,AssemblyVersion=1.2.0.64  --no-self-contained
                    }			  
					      }

                stage('Publish micro-database-management') {
                    environment { 
                        svcname = "micro-database-management"
                        svcfolder = "standard\\server"		 
                        outputfolder = "standard\\Taskbuilder\\WebFramework\\${env.svcname}"	   			
                      }             
                    steps {     
                            dir ("${env.WORKSPACE}\\${env.svcfolder}\\${env.svcname}") {bat "del web.config"}
                            bat "dotnet publish --framework netcoreapp3.1 ${env.WORKSPACE}\\${env.svcfolder}\\${env.svcname}\\${env.svcname}.csproj -c release -o  ${env.WORKSPACE}\\${env.outputfolder} -p:Version=${env.version}.${env.BUILD_ID},AssemblyVersion=${env.version}.${env.BUILD_ID}"
			              //da provare in un prossimo passo -r linux-x64 -p:Version=1.2.0.64,AssemblyVersion=1.2.0.64  --no-self-contained
                    }			  
					      }

                stage('Publish web-server') {
                    environment { 
                        svcname = "web-server"
                        svcfolder = "standard\\server"		 
                        outputfolder = "standard\\Taskbuilder\\WebFramework\\${env.svcname}"	   			
                      }             
                    steps {     
                            dir ("${env.WORKSPACE}\\${env.svcfolder}\\${env.svcname}") {bat "del web.config"}
                            bat "dotnet publish --framework netcoreapp3.1 ${env.WORKSPACE}\\${env.svcfolder}\\${env.svcname}\\${env.svcname}.csproj -c release -o  ${env.WORKSPACE}\\${env.outputfolder} -p:Version=${env.version}.${env.BUILD_ID},AssemblyVersion=${env.version}.${env.BUILD_ID}"
			              //da provare in un prossimo passo -r linux-x64 -p:Version=1.2.0.64,AssemblyVersion=1.2.0.64  --no-self-contained
                    }			  
					      }

				    //le due parentesi che seguono chiudono lo stage parallel
                 }
              }

          stage('Create Docker images') {
            parallel{
                stage('account-manager') 
                   agent { label 'spp-m4c-002' }
                {
                    environment { 
                        svcname = "account-manager"
                        svcfolder = "standard\\server"
                        dcbxmlfilefpath = "C:\\CID\slnMago4Cloud\\${env.svcname}.DockerContextDefinition.xml"		 
                        outputfolder = "buildartifacts\\${env.svcname}"	  			
                      }             
                    steps {    
                          //esegue la copia dei file descritti in xml  
                          bat "dotnet ${env.dcbpath} -c ${env.dcbxmlfilefpath} -s ${env.WORKSPACE} -d  ${env.WORKSPACE}\\${env.outputfolder}"
                          powershell label: 'crea share di rete', script: 'if (-not (Test-Path "Q:\")) {net use Q: \\spp-m4c-001\\quicktest-buildartifacts /u:ccnet}'
                          bat "docker login --username ${env.DockerLoginUsr} --password ${env.DockerLoginPwd}"
                          bat "docker build --build-arg version=${env.version}.${env.BUILD_ID} -t microarea/${env.svcname}:${env.tag} --pull=true --file=Q:\\${env.svcname}\\${env.svcname}-linux.dockerfile Q:\\account-manager\\"
                    }			  
					      }
                stage('menu-service') 
                   agent { label 'spp-m4c-002' }
                {
                    environment { 
                        svcname = "menu-service"
                        svcfolder = "standard\\server"
                        dcbxmlfilefpath = "C:\\CID\slnMago4Cloud\\${env.svcname}.DockerContextDefinition.xml"		 
                        outputfolder = "buildartifacts\\${env.svcname}"	   			
                                 }             
                    steps {    
                          //esegue la copia dei file descritti in xml  
                          bat "dotnet ${env.dcbpath} -c ${env.dcbxmlfilefpath} -s ${env.WORKSPACE} -d  ${env.WORKSPACE}\\${env.outputfolder}"
                          powershell label: 'crea share di rete', script: 'if (-not (Test-Path "Q:\")) {net use Q: \\spp-m4c-001\\quicktest-buildartifacts /u:ccnet}'
                          bat "docker login --username ${env.DockerLoginUsr} --password ${env.DockerLoginPwd}"
                          bat "docker build --build-arg version=${env.version}.${env.BUILD_ID} -t microarea/${env.svcname}:${env.tag} --pull=true --file=Q:\\${env.svcname}\\${env.svcname}-linux.dockerfile Q:\\account-manager\\"
                    }			  
					      }

                stage('micro-database-management') 
                   agent { label 'spp-m4c-002' }
                {
                    environment { 
                        svcname = "micro-database-management"
                        svcfolder = "standard\\server"
                        dcbxmlfilefpath = "C:\\CID\\slnMago4Cloud\\${env.svcname}.DockerContextDefinition.xml"		 
                        outputfolder = "buildartifacts\\${env.svcname}"	   			
                                 }             
                    steps {    
                          //esegue la copia dei file descritti in xml  
                          bat "dotnet ${env.dcbpath} -c ${env.dcbxmlfilefpath} -s ${env.WORKSPACE} -d  ${env.WORKSPACE}\\${env.outputfolder}"
                          powershell label: 'crea share di rete', script: 'if (-not (Test-Path "Q:\")) {net use Q: \\spp-m4c-001\\quicktest-buildartifacts /u:ccnet}'
                          bat "docker login --username ${env.DockerLoginUsr} --password ${env.DockerLoginPwd}"
                          bat "docker build --build-arg version=${env.version}.${env.BUILD_ID} -t microarea/${env.svcname}:${env.tag} --pull=true --file=Q:\\${env.svcname}\\${env.svcname}-linux.dockerfile Q:\\account-manager\\"
                    }			  
					      }

                stage('tbw-taskbuilder') 
                   agent { label 'spp-m4c-002' }
                {
                    environment { 
                        svcname = "tbw-taskbuilder"
                        svcfolder = "standard\\server"
                        dcbxmlfilefpath = "C:\\CID\slnMago4Cloud\\${env.svcname}.DockerContextDefinition.xml"		 
                        outputfolder = "buildartifacts\\${env.svcname}"	   			
                                 }             
                    steps {    
                          //esegue la copia dei file descritti in ml  
                          bat "dotnet ${env.dcbpath} -c ${env.dcbxmlfilefpath} -s ${env.WORKSPACE} -d  ${env.WORKSPACE}\\${env.outputfolder}"
                          //copia il file entryhpint dell'immagine (dockerstart.ps1) 
                          powershell label: 'copia il file entryhpint dell'immagine', script: 'Copy-Item -Path C:\\CID\\slnMago4Cloud\\dockerstart.ps1 -Destination "${env.WORKSPACE}\\${env.outputfolder}"\\Apps\\TBApps\\Release'
                          bat "docker login --username ${env.DockerLoginUsr} --password ${env.DockerLoginPwd}"
                          bat "docker build --build-arg version=${env.version}.${env.BUILD_ID} -t microarea/${env.svcname}:${env.tag} --pull=true --file=Q:\\${env.svcname}\\${env.svcname}-linux.dockerfile Q:\\account-manager\\"
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
