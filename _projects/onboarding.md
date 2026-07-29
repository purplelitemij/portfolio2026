---
layout: page
title: Onboarding
description: This is a sample onboarding guide for an audience of 10,000+ users.
importance: 4
category: software-development
---
<i>The sample below is an onboarding guide written during my tenure at JPMorganChase. Note that all proprietary information (Account numbers, hostnames, credential-issuance information, email addresses, change ticket number,...) has been removed.</i>

## Why passwordless identity

Application teams historically stored long-lived functional account credentials in a shared credentials store so pipelines could authenticate without a human typing a password at deploy time. That store held credentials for thousands of deployment accounts across hundreds of applications, providing access into hosting platforms, cloud accounts, and container registries. A shared secrets store at that scale is also a concentrated risk: any credential in it could be used well beyond the pipeline it was meant for, and rotating or auditing thousands of stored passwords is its own ongoing burden.

The platform team's answer was a passwordless identity solution: instead of a pipeline reading a stored password, it authenticates using a short-lived, scoped token tied to the pipeline's own identity. This removed the need for a human (or a script) to ever know a privileged password, and it let security teams reason about *what a pipeline is allowed to do* rather than *what password it happens to hold*.

## Onboarding process

Onboarding is a self-service process kicked off from the internal developer platform, with one prerequisite: the project must already exist in that platform. 

From there:
1. The project is onboarded to the passwordless identity service.
2. Three scoped identities are created automatically, one each for Dev, UAT, and Prod.
3. Those identities are entitled with the appropriate roles for their environment.
4. The pipeline is configured to authenticate with its identity instead of a stored password.

A few constraints worth calling out up front, since they shaped a lot of the support questions I fielded: these identities are for automated, passwordless use inside a pipeline only (interactive human login still requires a traditional account), each identity is scoped to a single directory domain, and the declarative pipeline pattern is the supported path, while customized scripted pipelines have a narrower, separately documented support surface (see **Related Information** below).

## Configuring for target platforms

Once a project is onboarded, the identity still has to be wired into whatever it's deploying *to*. I wrote platform-specific configuration guides for each supported integration, since the setup differs by target:

- Artifact repositories and container registries
- Cloud platforms (Azure and AWS, including common AWS services)
- Kubernetes-based hosting platforms
- Infrastructure-as-code tooling (including database and data-warehouse integrations)
- Container image scanning
- Performance testing tooling
- Legacy Kerberos-based credential stores, for systems that couldn't yet move to token-based auth

Each guide followed the same shape: why you'd use it, the prerequisites, and a worked configuration example, so a team could find their platform and be productive without reading the others.

## Credential compliance and remediation

Privileged identities created through this system still need to show up correctly in the firm's credential-compliance tooling, or they create an automatic compliance flag for the team that owns them. I documented the remediation steps (how to mark an identity as a service-to-service account so it's recognized automatically) and the troubleshooting steps for the two most common failure modes support saw: authorization errors from an incompletely onboarded identity, and stale resource records that needed a manual reprocess. Most of these tickets were resolvable by the requester once the steps were written down clearly, which took real load off the platform team's support queue.

## Related Information

- [Identity for cloud platforms]({{ "/projects/identity-for-cloud-platforms/" | relative_url }})
- [Identity for scripted pipelines]({{ "/projects/identity-for-scripted-pipelines/" | relative_url }})
