---
layout: page
title: "Identity for Scripted Pipelines"
description: Sample platform-specific identity guide, referenced from the Onboarding sample.
---
Referenced from [Onboarding]({{ "/projects/onboarding/" | relative_url }}). Note that all proprietary information has been removed.

## Overview

The identity service is built and supported around the platform's standard, declarative pipeline pattern. Some teams still run customized, hand-scripted pipelines instead, and while those aren't the primary supported path, a scaled-down integration exists so those teams aren't locked out of passwordless authentication entirely.

I wrote this guide specifically to set expectations up front: scripted pipelines are self-supported. If a team's custom scripting breaks, the platform team will help with anything related to the identity service itself, but not with debugging the team's own pipeline code. Making that boundary explicit in the doc cut down on a real number of support tickets that were actually scripting questions, not identity-service questions.

## What it covers

For teams that do need it, the integration exposes credential-provider helpers that a scripted pipeline can call to authenticate to the platforms it needs, for example:

- Artifact repository logins and artifact downloads
- Kubernetes cluster logins
- Cloud platform CLI logins
- Fetching a short-lived access token for calling an internal API directly
- Cloud provider logins (with production access gated behind a change ticket, same as the declarative pattern)
- Fetching credentials for legacy Kerberos-based systems

Each of these follows the same basic shape in the documentation: a short description of when you'd use it, the inputs it needs, and a minimal working example, shown three ways (inline in the pipeline script, as a reusable closure, and as a one-line config reference) so a team could match whichever pattern their existing pipeline already used.

## Troubleshooting

The two failure modes I documented in the most detail were authorization errors (usually an identity that wasn't fully onboarded yet) and stale downstream records (resolved by re-processing the identity's record in the relevant admin tool). Both were things a requester could self-resolve once they knew where to look, which was the point of writing them up instead of leaving them as tickets to the platform team.
