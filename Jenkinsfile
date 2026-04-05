pipeline {
    agent {
        kubernetes {
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: devops-tools
    image: alpine/k8s:1.29.2
    command: [cat]
    tty: true
'''
        }
    }
    stages {
        stage('Deploy to K8s') {
            steps {
                container('devops-tools') {
                    echo 'Applying Deployment and Service...'
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl get pods,svc -l app=devops-app'
                }
            }
        }
    }
}
