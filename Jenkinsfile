pipeline {
    agent {
        kubernetes {
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: devops-tools
    image: alpine/k8s:1.29.2  # This image has git, kubectl, and helm pre-installed
    command:
    - cat
    tty: true
'''
        }
    }
    stages {
        stage('Checkout') {
            steps {
                container('devops-tools') {
                    checkout scm
                }
            }
        }
        stage('Verify Cluster') {
            steps {
                container('devops-tools') {
                    echo 'Checking Kubernetes Nodes...'
                    sh 'kubectl get nodes'
                }
            }
        }
    }
}
