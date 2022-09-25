pipeline {
    agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        metadata:
          labels:
            some-label: some-label-value
        spec:
          containers:
          - name: maven
            image: maven:alpine
            command:
            - cat
            tty: true
          - name: kubectl
            image: joshendriks/alpine-k8s
            command:
            - /bin/cat
            tty: true  
        '''
    }
  }

    stages {
        stage('git version') {
            steps {
                sh 'git version'
            }
        }
        stage('maven version'){
            steps {
                container('maven'){
                    sh 'mvn --version'
                }
            }
        }
        stage('kubernetes version') {
            steps {
                container('kubectl') {
                    withKubeConfig([credentialsId: 'kubeconfig']) {
                        sh 'kubectl version --short'
                    }
                }
            }
        }
    }
}





// pipeline {
//   agent any

//   stages {
//       stage('Build Artifact') {
//             steps {
//               sh "mvn clean package -DskipTests=true"
//               archive 'target/*.jar' //so that they can be downloaded later
//             }
//       stage("Unit tests") {
//         steps {
//           sh "mvn test"
//         }
//       }
//         }   
//     }
// }


