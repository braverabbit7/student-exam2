pipeline {
  environment {
        registry = "braverabbit/epam-exam"
        registryCredential = 'dockerhub'
  }
  agent {
        label 'jenkins_sl'
  }
    
  stages {
    stage("Run_sc") {
      steps {
        sh """
         python3 -m venv venv
                    . venv/bin/activate
                    pip install -e .
                    export FLASK_APP=js_example
                    pip install -e '.[test]'
                    coverage run -m pytest
                    coverage report
                    deactivate
                """
      }
    }
    stage("Build_image") {
            steps {
              sh '''
                docker build . -t braverabbit/epam-exam:web-app
                '''
            }
            }
    	 stage('Publish') {
      
      steps {
        withDockerRegistry([ credentialsId: "086567c7-9749-4154-b5e0-03f99636c04f", url: "" ]) {
          sh 'docker push braverabbit/epam-exam:web-app'
		  }
		  }
        }

  }
}
