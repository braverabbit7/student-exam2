pipeline {
  environment {
    registry = "braverabbit/epam-exam"
  }
  agent { label 'jenkins_sl' } 
   stages {
    stage ('Python tests') {
     steps {
      sh """
      python3 -m venv venv
                    . venv/bin/activate
            
      """
       }
      }
       
    }
}
