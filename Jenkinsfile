pipeline{
    agent  any
    tools {
            maven 'maven-3.8.6'
        }
    options {
        //discardbuilds 
        buildDiscarder logRotator(artifactDaysToKeepStr: '30', artifactNumToKeepStr: '10', daysToKeepStr: '5', numToKeepStr: '5')
        
    }
    stages{
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh "mvn --version"
                sh "mvn  install -DskipTests" //DskipTests-it skip tests in this stage
            }
        }
        stage('Test Maven - JUnit and Jacoco') {
            steps {
              sh "mvn test"
               jacoco()
            }
            
        }
        stage('upload artifcat to s3') {
            steps {
                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'myartifact-store', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: true, selectedRegion: 'ap-south-1', showDirectlyInBrowser: true, sourceFile: '**/*.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'S3-Artifactupload', userMetadata: []
            }
            
        }
        
    }
}
