node {
    checkout scm
    stage('Build') {
    	docker.image('maven:3.8.6-eclipse-temurin-18-alpine').inside('-v /root/.m2:/root/.m2') {
		sh 'mvn -B -DskipTests clean package'
	}
    }
    stage('Test') {
    	try {
	        docker.image('maven:3.8.6-eclipse-temurin-18-alpine').inside('-v /root/.m2:/root/.m2') {
			sh 'mvn test'
		}
        } catch (e) {
                echo "Tahapan Test Gagal!"
        } finally {
                junit 'target/surefire-reports/*.xml'
        }
    }
    stage('Manual Approval'){
	    input message: 'Lanjutkan ke tahap Deploy?', ok: 'Proceed'
    }
    stage('Deploy') {
	    archiveArtifacts 'target/ProjectAkhir.jar'
	    docker.build("my-app:latest");
	   // sh "ssh-keyscan -H 54.169.218.67 >> ~/.ssh/known_hosts"
	   // sh "/usr/bin/scp -i /var/jenkins_home/notes-implementasi-cicd.pem /var/jenkins_home/workspace/submission-cicd-pipeline-iputuhariyadi/target/my-app-1.0-SNAPSHOT.jar  ubuntu@54.169.218.67:/home/ubuntu/my-app-1.0-SNAPSHOT.jar"
	    sh 'docker run --rm my-app'
	    sleep 60
    }
}