node {
    //checkout scm
    /* Requires the Docker Pipeline plugin to be installed */
     def customImage = docker.build("dockerfile")

    // docker.image('mysql:5.6.40').withRun('-e "MYSQL_ROOT_PASSWORD="') { c ->
    //     docker.image('mysql:5.6.40').inside("--link ${c.id}:db") {
    //         /* Wait until mysql service is up */
    //         sh 'while ! mysqladmin ping -hdb --silent; do sleep 1; done'
    //     }
    //     customImage.inside("--link ${c.id}:db") {
    //         /*
    //          * Run some tests which require MySQL, and assume that it is
    //          * available on the host name `db`
    //          */
    //         sh 'ruby -v'
    //     }
    // }
 
    /*
     * In order to communicate with the MySQL server, this Pipeline explicitly
     * maps the port (`3306`) to a known port on the host machine.
     */
    docker.image('mysql:5.6.40').withRun('-e "MYSQL_ROOT_PASSWORD=" -p 3306:3306'){c ->
        docker.image('mysql:5.6.40').inside("--link ${c.id}:db") {
            sh 'while ! mysqladmin ping -hdb --silent; do sleep 1; done'
            sh 'mysql --version'
            sh 'echo ${c.id}'
        }

        customImage.inside{
            sh 'ruby -v'
            sh 'echo ${c.id}'
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



