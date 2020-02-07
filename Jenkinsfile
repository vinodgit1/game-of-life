pipeline {
   agent any

   stages {
      stage('Check out') {
         steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/develop']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/raknas999/game-of-life.git']]])
         }
      }
   }
   stages {
      stage('Build') {
         steps {
            sh label: '', script: 'mvn clean package'
         }
      }
   }
   stages {
      stage('SonarQube') {
         steps {
            withSonarQubeEnv {
    // some block
			}
         }
      }
   }
   stages {
      stage('publish artificats') {
         steps {
            nexusPublisher nexusInstanceId: '1234', nexusRepositoryId: 'releases', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: '**/*.war']], mavenCoordinate: [artifactId: 'gameoflife', groupId: 'com.wakaleo.gameoflife', packaging: 'war', version: '1.0']]]
         }
      }
   }
   post
   {
    success {
            archiveArtifacts 'gameoflife-web/target/*.war'
        }
    failure {
         mail to:"sankar.dadi@qentelli.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "Build failed"
   }
}
