pipeline {
  environment {
    registry = "braverabbit/epam-exam"
    registryCredential = 'docker_login'
  }
  agent { label 'jenkins_sl' } 
   stages {
    stage ('Py_tests') {
     steps {
      sh """
        python3 -m venv venv
        . venv/bin/activate
        pip install wheel
        pip install -e '.[test]'
        coverage run -m pytest
        coverage report 
        deactivate
      """
       }
      }
    
	}
	}
