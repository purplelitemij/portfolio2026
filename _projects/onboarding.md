---
layout: page
title: Onboarding
description: This is a sample onboarding guide for an audience of 10,000+ users.
importance: 4
category: software-development
---
The sample below is an onboarding guide written during my tenure at a prior company. Note that all proprietary information has been removed.

## Overview

Buildi is a container build solution based on [ECS Fargate](...) and [Kaniko](...). It supports both local (Windows VDI, Linux VDI, and Mac) container builds and CI/CD pipeline container builds. It replaced an earlier "skaffold + kaniko" based solution.

> **Note:** Buildi is generally available (GA). Contact your platform support channel for help.

## Prerequisites

1. Set up your container registry (see your organization's container registry setup guide).
2. Create a `Dockerfile` under your repo.

## Getting Started: Installing Buildi CLI

To start using Buildi for building a container image locally, follow the instructions provided to install the Buildi CLI on your platform. See **Related Information** below.

## Related Information

- [Installing Buildi CLI on LVDI]({{ "/projects/buildi-installlvdi/" | relative_url }})
- [Installing Buildi CLI on Mac or Linux]({{ "/projects/buildi-install-mac-linux/" | relative_url }})
