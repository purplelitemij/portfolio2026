---
layout: page
title: "Identity for Cloud Platforms"
description: Sample platform-specific identity guide, referenced from the Onboarding sample.
---
Referenced from [Onboarding]({{ "/projects/onboarding/" | relative_url }}). Note that all proprietary information has been removed.

## Overview

Pipelines that deploy into a cloud platform need a way to authenticate to that platform, not just to the internal deployment system. For teams deploying to Azure, the passwordless identity service extends into Azure through federated authentication: rather than storing a client secret, an app registration in the target Azure tenant is configured to trust tokens issued by the identity service, so a pipeline can exchange its own short-lived identity token for access to Azure resources.

## Onboarding

Cloud-platform identity is layered on top of the base onboarding process. A project has to already be onboarded to the core identity service before it can request the cloud extension. Once that's in place, onboarding is again self-service: it provisions a scoped service principal in each of the environment's cloud tenants (typically one each for Dev, UAT, and Prod).

A couple of the tenants used for early-access and sandbox scenarios are restricted to a smaller group of users. For those, the request goes through the platform support channel instead of pure self-service, mostly so someone can confirm the requester actually needs access to a constrained environment before it's provisioned.

## Why this matters

Before this existed, teams deploying to the cloud from a pipeline had two bad options: store a long-lived cloud credential somewhere in the pipeline config, or have a person paste one in by hand at deploy time. Federated, token-based authentication removes both: nothing long-lived is stored, and the pipeline's access is scoped to exactly what its identity is entitled to.
