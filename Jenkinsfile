pipeline {

	agent any
	tools {
		maven 'm360'
	}

	stages {
	  stage('build') {
		steps {
		  sh 'mvn install -DskipTests'
		}
	  }

	  stage('test') {
		steps {
		  sh 'mvn test'
		  
		  post {
				archiveArtifacts artifacts: 'target/**.jar', followSymlinks: false
				junit stdioRetention: '', testResults: 'target/surefire-reports/*.xml'
			}
		}
	  }

}

}
