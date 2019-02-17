node {
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
        stage ('Initialize') {
            sh '''
                echo "PATH = ${PATH}"
                echo "M2_HOME = ${M2_HOME}"
            '''
        }
        
        stage ('Build JAR') {
            try {
                sh 'mvn package'
            } catch (e) {
                currentBuild.result = 'FAILURE'
            }
        }

        stage('Build Docker Image with Application') {
            docker.build("pchen2145/springbootimage:${imagetag}", "-f Dockerfile .")
            sh "docker tag pchen2145/springbootimage:${imagetag} pchen2145/springbootimage:latest"
        }
        stage('Push to DockerHub') {
            docker.withRegistry( '') {
                docker.image("pchen2145/springbootimage:${imagetag}").push()
                docker.image("pchen2145/springbootimage:latest").push()
            }
        }

    }
}
