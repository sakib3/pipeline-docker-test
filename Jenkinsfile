node {
    checkout scm
    /* Requires the Docker Pipeline plugin to be installed */
    def customImage = docker.build("dockerfile")
    customImage.inside {
        sh 'ruby -v'
    }
    // docker.image('mysql:5.6.40').withRun('-e "MYSQL_ROOT_PASSWORD=my-secret-pw"'){c ->
    //     docker.image('mysql:5.6.40').inside{
    //         /* Wait until mysql service is up */
    //         sh 'mysql --version'
    //     }
    //     docker.image('node:7-alpine').inside {
    //         stage('Test') {
    //             sh 'node --version'
    //             sh 'mysql --version'
    //         }
    //     }
    // }
}
// pipeline {
//     agent {
//         docker { image 'mysql:5.6.40' }
//     }
//     stages {
//         stage('Mysql') {
//             steps {
//                 sh 'mysql --version'
//             }
//         }
//     }
// }


// pipeline {
//     agent {
//         dockerfile true
//     }
//     stages {
//         stage('Setup-Mysql') {
//             agent {
//                 docker { image 'mysql:5.6.40' }
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



