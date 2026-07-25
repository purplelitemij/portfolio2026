---
layout: page
title: "Installing Buildi CLI on Mac or Linux"
description: Sample platform-specific install guide, referenced from the Onboarding sample.
---
Referenced from [Onboarding]({{ "/projects/onboarding/" | relative_url }}). Note that all proprietary information has been removed.

## Overview

Users can install the Buildi CLI on a Mac or Linux workspace to start building containers. This document provides instructions on how to install the Buildi CLI on a Mac or Linux workspace.

## Running Buildi CLI on Mac or Linux Workspace

1. Download the latest [Buildi CLI](...). Download `darwin-amd64` for Mac and `linux-amd64` for a Linux workspace.
2. Unzip the file and put the binary in your `PATH`.
3. Set the directory to store your container registry credentials:

   ```
   export BUILDI_CONFIG_DIR=<your local path> # This is the location to store your artifactory api key data. If this variable is not set up, it will get stored under the $TMPDIR folder
   ```

4. Follow the instructions from [Buildi Login](...) to set up your container registry credentials.
5. Run the command to build your artifact; Buildi will use it as context to build the container image:

   ```
   cd <your_service_repo_folder>
   mvn clean install # Run command to build your artifacts, this is an example for a Java project.
   ```

6. Run the Buildi command to build the container. Make sure the Dockerfile is in the same folder:

   ```
   buildi build registry.example.com/container-sandbox/<projectkey>/<service-folder> # Replace with your own container registry namespace and service folder.

   # The following is an example of build command output
   Sending build context [==============================================>] 47.85MB/47.85MB
   BuildId: 7188462669c747eea44c9eea06bab6a9
   Status: PROVISIONING
   Status: PENDING
   Status: RUNNING
   INFO[0002] Using dockerignore file: /kaniko/buildcontext/.dockerignore
   INFO[0002] Retrieving image manifest registry.example.com/container-base/managedbaseimages/oracle-jdk:11-stable
   INFO[0002] Retrieving image registry.example.com/container-base/managedbaseimages/oracle-jdk:11-stable from registry registry.example.com
   INFO[0003] Built cross stage deps: map[]
   INFO[0003] Retrieving image manifest registry.example.com/container-base/managedbaseimages/oracle-jdk:11-stable
   INFO[0003] Returning cached image manifest
   INFO[0003] Executing 0 build triggers
   INFO[0003] Building stage 'registry.example.com/container-base/managedbaseimages/oracle-jdk:11-stable' [idx: '0', base-idx: '-1']
   INFO[0003] Unpacking rootfs as cmd COPY target/sample-events-processor-${gavVersion}.jar /app/ requires it.
   INFO[0028] LABEL org.opencontainers.image.source="https://${REPO_HOSTNAME}/projects/${PROJECT}/repos/${REPO}/browse?at=${COMMIT_HASH}"
   INFO[0028] Applying label org.opencontainers.image.source=https:///projects//repos//browse?at=
   INFO[0028] LABEL org.opencontainers.image.revision="${COMMIT_HASH}"
   INFO[0028] Applying label org.opencontainers.image.revision=
   INFO[0028] LABEL org.opencontainers.image.title="sample-events-processor"
   INFO[0028] Applying label org.opencontainers.image.title=sample-events-processor
   INFO[0028] ARG gavVersion=0.0.0-SNAPSHOT
   INFO[0028] ENV gavVersion ${gavVersion}
   INFO[0028] COPY target/sample-events-processor-${gavVersion}.jar /app/
   INFO[0028] Taking snapshot of files...
   INFO[0029] RUN chown -R appuser:appuser /app/ && chmod 444 /app/sample-events-processor-${gavVersion}.jar
   INFO[0029] Initializing snapshotter ...
   INFO[0029] Taking snapshot of full filesystem...
   INFO[0031] Cmd: /bin/sh
   INFO[0031] Args: [-c chown -R appuser:appuser /app/ && chmod 444 /app/sample-events-processor-${gavVersion}.jar]
   INFO[0031] Util.Lookup returned: &{Uid:0 Gid:0 Username:root Name: HomeDir:/root}
   INFO[0031] Performing slow lookup of group ids for root
   INFO[0031] Running: [/bin/sh -c chown -R appuser:appuser /app/ && chmod 444 /app/sample-events-processor-${gavVersion}.jar]
   INFO[0031] Taking snapshot of full filesystem...
   INFO[0032] CMD java $JAVA_OPTS -jar /app/sample-events-processor-${gavVersion}.jar
   INFO[0032] Pushing image to registry.example.com/container-sandbox/sample-service/sample-events-processor
   INFO[0042] Pushed registry.example.com/container-sandbox/sample-service/sample-events-processor@sha256:cfe2aef10650f4baf7573eccf3ccdbc1c04ae5789c3770573769a7525503763d // This is your container image built through Buildi
   Status: DEPROVISIONING
   ```
