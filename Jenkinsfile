pipeline {
    agent {
        docker { image 'mysql:5.6.40' }
    }
    stages {
        stage('Mysql') {
            steps {
                sh 'mysql --version'
            }
        }
    }
}
// pipeline {
//     agent {
//         dockerfile true
//     }
//     stages {
//         stage('Setup-Mysql') {
//             agent {
//                 docker { image 'mysql:5.6.40' }
//             }
//             steps {
//                 sh 'mysql --version'
//             }
//         }
//         stage('Build') {
//             steps {
//                 sh 'uname -a'
//                 sh 'ruby -v'
//                 sh 'mysql --version'
//             }
//         }
//     }
// }