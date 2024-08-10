pipeline {
    agent any

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                // Clone the Git repository
                git branch: 'main', url: 'https://github.com/Sachintech-github/10-MicroService-Appliction.git'
                
                // Print the workspace directory
                sh 'echo "Jenkins workspace directory:"'
                sh 'echo $WORKSPACE'
                
                // List contents of the entire workspace
                sh 'echo "Workspace contents after checkout:"'
                sh 'ls -la $WORKSPACE'
                
                // List contents specifically in src/adservice
                sh 'echo "Contents of src/adservice directory:"'
                sh 'ls -la $WORKSPACE/src/adservice/'
            }
        }
		
        stage('SonarQube') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectKey=10-Tier -Dsonar.projectName=10-Tier -Dsonar.java.binaries=. || echo "SonarQube scan failed" '''
                }
            }
        }
		
        stage('adservice') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        dir("${env.WORKSPACE}/src/adservice") {
                            sh "docker build -t sachintech/adservice:latest ."
                            sh "docker push sachintech/adservice:latest"
                            sh "docker rmi sachintech/adservice:latest"
                        }
                    }
                }
            }
        }
		
        stage('cartservice') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        dir("${env.WORKSPACE}/src/cartservice/src") {
                            sh "docker build -t sachintech/cartservice:latest ."
                            sh "docker push sachintech/cartservice:latest"
                            sh "docker rmi sachintech/cartservice:latest"
                        }
                    }
                }
            }
        }
		
        stage('checkoutservice') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        dir("${env.WORKSPACE}/src/checkoutservice") {
                            sh "docker build -t sachintech/checkoutservice:latest ."
                            sh "docker push sachintech/checkoutservice:latest"
                            sh "docker rmi sachintech/checkoutservice:latest"
                        }
                    }
                }
            }
        }
		
        stage('currencyservice') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        dir("${env.WORKSPACE}/src/currencyservice") {
                            sh "docker build -t sachintech/currencyservice:latest ."
                            sh "docker push sachintech/currencyservice:latest"
                            sh "docker rmi sachintech/currencyservice:latest"
                        }
                    }
                }
            }
        }
        
        stage('emailservice') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        dir("${env.WORKSPACE}/src/emailservice") {
                            sh "docker build -t sachintech/emailservice:latest ."
                            sh "docker push sachintech/emailservice:latest"
                            sh "docker rmi sachintech/emailservice:latest"
                        }
                    }
                }
            }
        }
		
        stage('frontend') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        dir("${env.WORKSPACE}/src/frontend") {
                            sh "docker build -t sachintech/frontend:latest ."
                            sh "docker push sachintech/frontend:latest"
                            sh "docker rmi sachintech/frontend:latest"
                        }
                    }
                }
            }
        }
		
        stage('loadgenerator') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        dir("${env.WORKSPACE}/src/loadgenerator") {
                            sh "docker build -t sachintech/loadgenerator:latest ."
                            sh "docker push sachintech/loadgenerator:latest"
                            sh "docker rmi sachintech/loadgenerator:latest"
                        }
                    }
                }
            }
        }
		
        stage('paymentservice') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        dir("${env.WORKSPACE}/src/paymentservice") {
                            sh "docker build -t sachintech/paymentservice:latest ."
                            sh "docker push sachintech/paymentservice:latest"
                            sh "docker rmi sachintech/paymentservice:latest"
                        }
                    }
                }
            }
        }
        
        stage('productcatalogservice') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        dir("${env.WORKSPACE}/src/productcatalogservice") {
                            sh "docker build -t sachintech/productcatalogservice:latest ."
                            sh "docker push sachintech/productcatalogservice:latest"
                            sh "docker rmi sachintech/productcatalogservice:latest"
                        }
                    }
                }
            }
        }
		
        stage('recommendationservice') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        dir("${env.WORKSPACE}/src/recommendationservice") {
                            sh "docker build -t sachintech/recommendationservice:latest ."
                            sh "docker push sachintech/recommendationservice:latest"
                            sh "docker rmi sachintech/recommendationservice:latest"
                        }
                    }
                }
            }
        }
		
        stage('shippingservice') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        dir("${env.WORKSPACE}/src/shippingservice") {
                            sh "docker build -t sachintech/shippingservice:latest ."
                            sh "docker push sachintech/shippingservice:latest"
                            sh "docker rmi sachintech/shippingservice:latest"
                        }
                    }
                }
            }
        }
        
        stage('K8-Deploy') {
            steps {
                withKubeConfig(caCertificate: '', clusterName: 'my-eks22', contextName: '', credentialsId: 'kubectl-token', namespace: 'webapps', restrictKubeConfigAccess: false, serverUrl: 'https://3C275AE4236F6E2F88051B50265245B6.gr7.ap-south-1.eks.amazonaws.com') {
                    sh 'kubectl apply -f deployment-service.yml'
                    sh 'kubectl get pods '
                    sh 'kubectl get svc'
                }
            }
        }
    }
}
