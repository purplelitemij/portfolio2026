---
layout: page
title: Configuration
description: This is a sample configuration guide I wrote for an audience of 10,000+ users.
importance: 6
category: software-development
---
The sample below is a configuration guide written during my tenure at JPMorganChase. Note that all proprietary information has been removed.

```
## Setup

Follow the project guidelines on [Jules Setup](...).
1. Create a blank `Jenkinsfile`.
   <br> Note: The file naming convention is **case-sensitive** and using "JenkinsFile" will not work.
2. Create a blank `jules.yml` file.
3. Create `Makefile`.

## Jenkinsfile

Add a `Jenkinsfile`, to your root directory.

```groovy
#!groovy?
@Library('julesGlobalLibrary@6.STABLE') _

buildPipeline()

def buildPipeline() {
    jules_pipelineRunner {
        yml = "jules.yml"
    }
}
```

## Jules.yml

To build a C/C++ application using Make tool, specify the `buildtype` as `cppmake`. To understand the SDLC support, visit [c-cpp](...).
In the example, `node` should be your own image. To build an image, see your internal build-image guide.

```yaml
appId: <APP ID>
node: python-3.11

buildConfig:
  buildType: cppmake
sonarDetails:
  additionalProperties: "-Dsonar.cfamily.build-wrapper-output=. -Dsonar.cfamily.gcov.reportsPath=."
  sourcesPath: src

frs:
  release: "master"
mapping:
  - name: feature
    tasks:
      preBuild:
        - artifact: download entry thirdparty:/google-protobuf/2.4.1 --path . --truncate
        - artifact: download entry thirdparty:/lbm-ume/6.1 --path /
        - artifact: download entry thirdparty:/gcc/10.2.0-2/x86_64-linux-2.6-libc6 --path /
```

If you require libraries that aren't available in the builder node, you will need to download them from the artifact repository, it may be preferable to use a closure to allow for parallel downloads of artifact entries, or you can specify the artifact download in the `jules.yml` file.

To download it to the path `/opt/thirdparty/...`, use `--path /`. Examples show how to download from the artifact repository via definition in `Jenkinsfile`, closure definition or script.

```groovy
#!groovy?
@Library('julesGlobalLibrary@6.STABLE') _
artifactMap = [
        "thirdparty:/google-protobuf/2.4.1" : "/opt/thirdparty/google-protobuf/",
        "thirdparty:/lbm-ume/6.1" : "/opt/thirdparty/lbm-ume/"
]

buildPipeline()

def buildPipeline() {
    jules_pipelineRunner {
        yml = "jules.yml"
        downloadEntryFromArtifactRepo = downloadEntryFromArtifactRepo()
        setupBuildSandbox = setupBuildSandbox(this.artifactMap, downloadEntryFromArtifactRepo)
    }
}

def setupBuildSandbox(artifactMap, downloadEntryFromArtifactRepo) {
    { steps, domain, config ->
        /* other pre build setup*/
        downloadEntryFromArtifactRepo(steps, artifactMap)
    }
}

def downloadEntryFromArtifactRepo () {
    { steps, artifactMap ->
        steps.stage("Download Artifact Dependencies") {
            steps.artifact_login("ARTIFACT_CREDENTIALS")
            def downloadFromArtifactStage = [failFast: false]
            artifactMap.each { entry, targetPath ->
                def expandedEntryPath = targetPath + "/" + entry.tokenize('/').last()
                if (!steps.fileExists(expandedEntryPath)) {
                    downloadFromArtifactStage["Artifact download $entry"] = {
                        steps.sh("artifact download entry $entry --path $targetPath --truncate")
                    }
                }
            }
            steps.parallel(downloadFromArtifactStage)
        }
    }
}
```

This download needs to happen on every build. Time is dependent on the size of your downloads and how many libraries are being downloaded. You can also create your own build image with the third-party packages already installed. For more information, see your internal build-image guide.

This shows where to run the artifact download command to download the libraries (we are downloading it before the project builds) or closure method for a more advanced pre-build setup:

```yaml
mapping:
  - name: feature
    tasks:
      preBuild:
        - artifact: download entry thirdparty:/gcc/10.2.0-2/x86_64-linux-2.6-libc6 --path /
        - closure: downloadEntryFromArtifactRepo
```

### Makefile
A sample `Makefile` at the root directory.
```shell
# Default target executed when no arguments are given to make.
default_target: ci
SHELL := /bin/bash

.PHONY : default_target

ci: helloworld

helloworld.cpp.o: src/helloworld.cpp
	@echo "Compiling helloworld.cpp"
	/bin/c++ -o helloworld.cpp.o -c src/helloworld.cpp

helloworld: helloworld.cpp.o
```

### Sample source code
A sample cpp file `src/helloworld.cpp`.
```shell
#include <iostream>
using namespace std;

int main() {
  cout << "Hello world..";
  return 0;
}
```

### Build

The default command that make uses to build your project is "make ci", assuming a Makefile is present in the root directory of the application.

You can override the build command for each branch by setting the build option under the mapping section:
```yaml
mapping:
  - name: feature
    build: -j$(nproc) -f build/Makefile install
```

You can also append additional settings to the build command, for example to specify additional targets for every branch you could use toolSetting:
```yaml
buildConfig:
  toolSettings: additionalTarget
```

Which would end up with this command being run "make -j32 -f build/Makefile install additionalTarget"

If you need to create variables and export them to the path, you can do the following:
```yaml
buildConfig:
  env:
    variables:
      - OPENSSL_INCL_DIR: /opt/thirdparty/openssl/0.9.8k/x86_64-linux-2.6-libc6/include
      - OPENSSL_LIB_DIR: /opt/thirdparty/openssl/0.9.8k/x86_64-linux-2.6-libc6/lib
```

If you have multiple repos that you need to checkout this can be done as a prebuild step with a closure or script.

#### Publishing artifacts

This will deploy the build artifact to the dev environment, see example:

```yaml
appId: <APP ID>
node: gcc720
buildConfig:
  env:
    variables:
      - OPENSSL_INCL_DIR: /opt/thirdparty/openssl/0.9.8k/x86_64-linux-2.6-libc6/include
      - OPENSSL_LIB_DIR: /opt/thirdparty/openssl/0.9.8k/x86_64-linux-2.6-libc6/lib
artifactPublish:
  adminCredentials: <CREDENTIALS>
  collection: <artifact collection>
  script: cp -r bin fileupload/
  credentials: <CREDENTIALS>
mapping:
  - name: feature
    tasks:
      preBuild:
        - artifact: download entry thirdparty:/google-protobuf/2.4.1 --path .
        - artifact: download entry thirdparty:/lbm-ume/6.1 --path /
        - closure: downloadEntryFromArtifactRepo
    environments:
      - name: dev
        custom:
          instancePrefix: <instance group prefix>
          fileGroupPrefix: <filegroup prefix>
          linkName: current_dev
          pollInterval: 60
          maxCount: 30
          adminCredentials: <CREDENTIALS>
```

```yaml
container:
  buildType: skaffold
  dockerfile: ./skaffoldBuild/Dockerfile
  skaffold:
    skaffoldYaml: ./skaffoldBuild/skaffold.yml
    targetRegistry: registry.example.com
    credentials: <artifactory_credentials>
    k8sLogin:
      credentials: <k8s_credentials>
      domainSuffix: <domain-suffix>
      endpoint: <endpoint>
```

### SonarQube Scans

By default, `cppmake` will download the C++ Sonar wrapper, extracting it to the working directory.
The build command will have the Sonar wrapper command prefixed and output the Sonar related files to the workspace directory e.g. "/tmp/build-wrapper-linux-x86/build-wrapper-linux-x86/build-wrapper-linux-x86-64 --out-dir . make ci".

The Sonar wrapper command can be overridden via the `buildConfiguration:buildWrapperConfig`

Example:
```yaml
buildConfig:
  buildType: cppmake
  buildWrapperConfig: "myWrapperCommand"
```

## Unsupported

Generating the bill of materials (sBOM) is not yet supported for C++.

## Troubleshooting

If there is a gcc version that is not available, you must create your own build image with the toolchain installed. See your internal build-image guide for more information.
```