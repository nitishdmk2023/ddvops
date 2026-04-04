pipeline {
    agent any 
    stages {
        stage('Install Tools') {
            steps {
                sh 'curl -LO "https://k8s.io(curl -L -s https://k8s.io)/bin/linux/amd64/kubectl"'
                sh 'chmod +x kubectl'
            }
        }
        stage('Hello DevOps') {
            steps {
                echo 'Pipeline triggered successfully!'
                // Use ./kubectl since it is in the current folder
                sh './kubectl get nodes' 
            }
        }
    }
}
