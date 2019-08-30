node {
    checkout scm
    docker.image('mysql:5.6.40').withRun('-e "MYSQL_ROOT_PASSWORD=my-secret-pw"') { c ->
        docker.image('mysql:5.6.40').inside("--link ${c.id}:db") {
            /* Wait until mysql service is up */
            sh 'while ! mysqladmin ping -hdb --silent; do sleep 1; done'
        }
        docker.image('centos:7').inside("--link ${c.id}:db") {
            /*
             * Run some tests which require MySQL, and assume that it is
             * available on the host name `db`
             */
            sh "echo ${c.id}"
            sh 'make check'
            sh 'mysql --version'
        }
    }
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



