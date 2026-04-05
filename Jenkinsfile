pipeline {
    agent {
        kubernetes {
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug
    command: [sleep]
    args: [9999999]
  - name: devops-tools
    image: alpine/k8s:1.29.2
    command: [cat]
    tty: true
'''
        }
    }
    stages {
        stage('Build Custom Image') {
            steps {
                container('kaniko') {
                    echo 'Building Docker Image without a Docker Daemon...'
                    // This builds the image locally inside the pod
                    sh '/kaniko/executor --context `pwd` --dockerfile Dockerfile --no-push'
                }
            }
        }
        stage('Deploy to K8s') {
            steps {
                container('devops-tools') {
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}
