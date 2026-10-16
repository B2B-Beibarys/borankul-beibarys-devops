pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Beibarys'
        STUDENT_SURNAME = 'Borankul'
        STUDENT_GROUP   = 'IT2-2306'
        STUDENT_ID      = '38293'
        IMAGE_NAME      = 'borankul-beibarys-devops'
        CONTAINER_NAME  = 'borankul-beibarys-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'python3 -m py_compile app/app.py'
                sh 'chmod +x scripts/Borankul_Beibarys_system.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'bash -n scripts/Borankul_Beibarys_system.sh'
                sh './scripts/Borankul_Beibarys_system.sh'
                sh 'test -f Dockerfile'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
                sh 'docker images | grep $IMAGE_NAME'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME \
                        -e STUDENT_NAME=$STUDENT_NAME \
                        -e STUDENT_SURNAME=$STUDENT_SURNAME \
                        -e STUDENT_GROUP=$STUDENT_GROUP \
                        -e STUDENT_ID=$STUDENT_ID \
                        $IMAGE_NAME
                    sleep 3
                    docker logs $CONTAINER_NAME
                    docker ps --filter name=$CONTAINER_NAME
                '''
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully' }
        failure { echo 'Pipeline failed' }
    }
}
