node {
    /* Requires the Docker Pipeline plugin to be installed */
    checkout scm
        stage('Build') {
            docker.image('maven:3.9.0').inside('-v /root/.m2:/root/.m2') {
                sh 'mvn -B -DskipTests clean package'
            }
        }

        stage('Test') {
            try {
                docker.image('maven:3.9.0').inside('-v /root/.m2:/root/.m2') {
                    'mvn test'
                }
            }
            catch(e){
                echo "Testing Gagal"
            }
            finally {
                junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml' 
            }
        }

        stage('Deliver') {
            docker.image('maven:3.9.0').inside('-v /root/.m2:/root/.m2') {
                sh './jenkins/scripts/deliver.sh'
            }
        }
}