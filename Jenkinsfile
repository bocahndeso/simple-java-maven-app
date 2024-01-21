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
        sh "mkdir -p /var/jenkins_home/.ssh/"
	    sh "ssh-keyscan -H 47.128.15.241 >> ~/.ssh/known_hosts"
	    sh "/usr/bin/scp -i /var/jenkins_home/Latihan-EC2.pem /var/jenkins_home/workspace/submission-cicd-pipeline-bocahndeso/target/ProjectAkhir.jar  ubuntu@47.128.15.241:/home/ubuntu/mProjectAkhir.jar"
	    sh 'docker run --rm my-app'
	    sleep 60
    }
}