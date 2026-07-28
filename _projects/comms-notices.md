---
layout: page
title: Communications
description: A collection of user communications authored to publicize feature changes and release information.
importance: 7
category: software-development
---

During my time at JPMorgan Chase, I owned the process for communicating major releases, features, changes, upgrades, and decommissions across the developer toolchain. 
Engineering and Product Management own the *what* (the change itself), but they aren't always the right owners of the *how* to get the message in front of the right audience, in the right format, without breaking the firm's communication standards. **That's the gap this process closed.** 

Engineering or Product Management would bring me the source information (by filling out an intake request or just looping me in directly) and I'd turn it into a reviewed, on-brand notice, publishing it through whichever channel actually reached the audience: email, the documentation portal, or in-product banners.

## Choosing the right channel

The biggest lesson embedded in this process: **email is reserved for communications with an explicit call-to-action.** General announcements, feature releases, and maintenance notices that don't require the reader to *do* something are delivered through in-product banners and an engineering notifications channel instead, not email. Reserving email for action items kept it meaningful, and kept everything else from training people to ignore it.

That rule, plus who needs to review a notice before it ships, came down to a simplified decision matrix:

| Use case | Delivery | Review needed |
|---|---|---|
| Maintenance/upgrade with no downtime or user impact | In-product banner + engineering channel notice (no email) | Peer review, review board approval, Customer Success sign-off |
| New feature, GA release, or deprecation with no call-to-action | In-product banner + engineering channel notice (no email) | Peer review, review board approval, Customer Success sign-off |
| Deprecation or any explicit call-to-action | Email to current user base + engineering channel notice | Peer review, review board approval, Customer Success sign-off, plus GM/leadership sign-off |
| Incident communications (unplanned outages) | Incident-management tool + engineering channel notice | Handled under incident process; no separate review |

Every communication also carried a minimum **seven business days** of review lead time, plus a **five business day** waiting period between final approval and distribution. This emphasized working with engineering teams early, before the change shipped, making it matter as much as the writing itself.

## The four templates

To make it easy for Engineering and Product Management to hand off a request without having to think about formatting or tone, I curated four pre-approved templates:

- **Call to Action**: for changes that require the reader to do something before a deadline
- **Decommission**: for retiring a feature, tool, or environment
- **Planned Maintenance**: for scheduled, no-impact or low-impact work
- **General Announcement**: for everything else worth telling the audience about

Each template captured the same core fields, so the published notice stayed consistent regardless of who requested it or which writer picked it up:

- **Title**: a short, descriptive summary of the change
- **What's happening**: a plain-language overview of the change, optionally paired with a screenshot or short clip
- **Who's affected**: the audience for the notice
- **What do I need to do**: the reader's action items, if any (this is what determined whether the notice qualified as a call-to-action)
- **Learn more**: links to supporting documentation
- **Resources**: where to subscribe to future notices or raise a support request

## Workflow

1. **Intake.** Engineering or Product Management submits a request either directly to me or through an intake form capturing the requester, the product/feature name, the desired distribution date, a link to any supporting material, and anyone who should be added as a watcher.
2. **Draft.** Using the appropriate template, I draft the notice and share it with the team for a first pass.
3. **Review.** The draft goes to a peer reviewer and a review board for approval, plus Customer Success and, for anything with a call-to-action, a leadership sign-off. The review board comprised of the product team and engineering leads.
4. **Publish.** Once approved, the notice goes out through the channel that matches its use case: email for call-to-action items, and in-product banners plus the engineering notifications channel for everything else. Every notice is also mirrored to the documentation portal so it stays discoverable after the initial push.

Routing each request through the same intake → draft → review → publish path (instead of handling each one ad hoc) meant Engineering always knew where to send a request, and I always knew a notice had been vetted by the right people before it reached customers.

The below communication is an example of a notification on the documentation portal:

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/PublishedComms_example.png" title="published comms doc portal" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    A published General Announcement notice, delivered through the documentation portal.
</div>
