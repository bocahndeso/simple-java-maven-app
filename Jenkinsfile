node {
    /* Requires the Docker Pipeline plugin to be installed */
    docker.image('maven:3.9.0').inside('-v /root/.m2:/root/.m2') {
        stage('Build') {
           sh 'mvn -B -DskipTests clean package'
        }

        stage('Test') {
            try {
                'mvn test'
            }
            finally {
                junit 'target/surefire-reports/*.xml'
            }
        }

        stage('Deliver') {
           sh './jenkins/scripts/deliver.sh'
        }

    }
}