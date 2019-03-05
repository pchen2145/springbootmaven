node ('master') {
    git url: 'https://github.com/pchen2145/springbootmaven.git'
    String jdktool = tool name: "Java 8 Open JDK", type: 'hudson.model.JDK'
    def mvnHome = tool name: 'Maven-3.6.0'

    /* Set JAVA_HOME, and special PATH variables. */
    List javaEnv = [
        "PATH+MVN=${jdktool}/bin:${mvnHome}/bin",
        "M2_HOME=${mvnHome}",
        "JAVA_HOME=${jdktool}"
    ]

    withEnv(javaEnv) {
        stage ('Initialize Env Variables') {
            sh '''
                echo "PATH = ${PATH}"
                echo "M2_HOME = ${M2_HOME}"
            '''
        }
        
        stage ('Build with Maven') {
            try {
                sh 'mvn clean package'
            } catch (e) {
                currentBuild.result = 'FAILURE'
            }
        }

        stage('Copy artifact into Docker Image') {
            docker.build("pchen2145/springbootimage:${dockertag}", "-f Dockerfile .")
            sh "docker tag pchen2145/springbootimage:${dockertag} pchen2145/springbootimage:latest"
        }
        stage('Push to DockerHub') {
            docker.withRegistry( '') {
                docker.image("pchen2145/springbootimage:${dockertag}").push()
                docker.image("pchen2145/springbootimage:latest").push()
            }
        }

    }
}
