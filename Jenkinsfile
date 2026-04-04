pipeline {
    agent any 
    stages {
        stage('Hello DevOps') {
            steps {
                echo 'Pipeline triggered successfully from GitHub Webhook!'
                sh 'kubectl get nodes'
            }
        }
    }
}
