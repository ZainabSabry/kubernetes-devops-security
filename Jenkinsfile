pipeline {
  agent {
      kubernetes {
          yaml '''
            apiVersion: v1
            kind: Pod
            metadata:
            labels:
                key: slave
            spec:
            containers:
            - name: maven
              image: maven:3.8.6-jdk-11
              command:
              - cat
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
        stage('Build Artifact') {
            steps {
                container("maven"){
                    sh "mvn clean package -DskipTests=true"
                    archive 'target/*.jar' //so that they can be downloaded later
                }
            }
        }
        stage("Unit tests") {
            steps {
                container("maven"){
                    sh "mvn test"
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


