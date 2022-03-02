                stage('Pull and tag tbw-taskBuilder') {
                    environment { 
                        gitrepo = "tbw-taskBuilder"
                        repofolder = "Standard\\Taskbuilder"
                        branch = "${env.tbbranch}"  
                      }             
                    steps {
                      dir ("${env.repofolder}") { git branch: env.branch, credentialsId: 'githubccnet', url: "${env.giturl}${env.gitrepo}.git" } }
             
                 }  				