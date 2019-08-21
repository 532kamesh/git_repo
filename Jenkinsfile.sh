pipeline{
	agent{
                stages{
                stage('clone'){
                                steps{
                                'checkout SCM'
                        }
                stage('build'){
                        sh 'mvn install'
                        }       
                stage('Test'){
                        sh 'mvn surefire:test'
                }
                stage('deploy'){
                sh 'sshpass -p "kamesh532@" scp target/*.war kamesh@172.17.0.3:/home/apache-tomcat-8.5.43/webapps
sshpass -p "kamesh532@" ssh kamesh@172.17.0.3 "JAVA_HOME=/home/jdk1.8.0_221" "/home/apache-tomcat-8.5.43/bin/startup.sh"'
        }
                        
                }       
        }       
}       
}

