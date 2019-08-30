pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('Build') {
            steps {
                sh 'uname -a'
                sh 'ruby -v'
                sh 'whoami'
            }
        }
    }
}